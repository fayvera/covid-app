require 'pry'
require 'httparty'


# require_relative('../lib/api')
require_relative('../lib/cli')
require_relative('../lib/model')
class Api
    @@api_key = "20210203123346"
    @@url = "https://data.cityofnewyork.us/resource/rc75-m7u3.json"

    def cases_by_date
        response = HTTParty.get(@@url)
        keys_to_extract = "date_of_interest", "case_count", "hospitalized_count", "death_count"
        response.each do |hash|
            cases = hash.select{|key, value| keys_to_extract.include? key}.transform_keys!(&:to_sym)
            cases[:date_of_interest] = cases[:date_of_interest].split("T")[0].split("-").rotate(1).join("/")
            Model.new(cases)
        end
    end  
end


