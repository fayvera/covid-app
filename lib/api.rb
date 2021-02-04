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
        keys_to_extract = "date_of_interest", "case_count", "hospitalized_count", "death_count", 
        "bx_case_count", "bx_hospitalized_count", "bx_death_count", "bk_case_count", "bk_hospitalized_count", "bk_death_count",
        "mn_case_count", "mn_hospitalized_count", "mn_death_count", "qn_case_count", "qn_hospitalized_count", "qn_death_count",
        "si_case_count", "si_hospitalized_count", "si_death_count"
        response.each do |hash|
            cases = hash.select{|key, value| keys_to_extract.include? key}.transform_keys!(&:to_sym)
            cases[:date_of_interest] = cases[:date_of_interest].split("T")[0].split("-").rotate(1).join("/")
            Model.new(cases)
        end
    end  
end


Api.new.cases_by_date