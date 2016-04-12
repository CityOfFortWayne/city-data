require 'csv'

namespace :crime do

  desc "Grabs the latest crime data from http://fwpd.org/daily"
  task :fwpd, [:date] do |t, args|
    date = Date.parse(args[:date]) || Date.yesterday

    data = Crime::FWPD.new(date).generate!

    CSV.open("#{ROOT_PATH}/../public/data/crime/#{date.iso8601}.csv", "wb") do |csv|
      csv << ['Incident', 'Time', 'Nature', 'Address']

      data.each do |crime|
        csv << crime.values
      end
    end

    File.open("#{ROOT_PATH}/../app/models/fixtures/crime/#{date.iso8601}.json", "wb") do |file|
      file.write(data.to_json)
    end
  end

  desc "Combine all crime data into one file"
  task :all do
    directory = "#{ROOT_PATH}/../public/data/crime"
    filename = "#{ROOT_PATH}/../public/data/crime-all.csv"

    if File.exists?(filename)
      File.delete(filename)
    end

    CSV.open(filename, "wb") do |csv|
      csv << ["Incident", "Time", "Nature", "Address", "Lat", "Lon"]

      Dir["#{directory}/*.csv"].flatten.each do |fname|
        date = fname.split("/").last.split(".").first
        CSV.foreach(fname, headers: true, header_converters: :symbol) do |row|
          csv << [row[:incident], "#{date} #{row[:time]}", row[:nature], row[:address], "", ""]
        end
      end
    end
  end

end
