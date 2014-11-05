module Crime
  class FWPD

    def initialize(date = Date.yesterday)
      @agent = Mechanize.new
      @date = date
    end

    def generate!
      data = page.search("table > tr").map do |row|
        columns = row.elements.to_a

        {
          incident: columns[0].text.strip,
              time: columns[1].text.strip,
            nature: columns[2].text.strip,
           address: columns[3].text.strip,
        }
      end

      data.delete_at(0)

      data
    end

  private

    BASE_URL = "http://fwpd.org/daily/display"

    def page
      @page ||= agent.get(full_path)
    end

    def agent
      @agent
    end

    def date
      @date
    end

    def full_path
      "#{BASE_URL}#{path}"
    end

    def path
      "/#{date.iso8601.gsub('-','')}.html"
    end

  end
end
