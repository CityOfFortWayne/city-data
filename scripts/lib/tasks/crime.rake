require 'csv'

namespace :crime do

  desc "Grabs the latest crime data from http://fwpd.org/daily"
  task :fwpd do
    date = Date.yesterday

    data = Crime::FWPD.new(date).generate!

    CSV.open("#{ROOT_PATH}/../public/crime/#{date.iso8601}.csv", "wb") do |csv|
      csv << ['Incident', 'Time', 'Nature', 'Address']

      data.each do |crime|
        csv << crime.values
      end
    end

    File.open("#{ROOT_PATH}/../app/models/fixtures/crime/#{date.iso8601}.json", "wb") do |file|
      file.write(data.to_json)
    end
  end

end
