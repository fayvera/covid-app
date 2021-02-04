require 'pry'
require 'httparty'

require_relative('../lib/api')
require_relative('../lib/cli')
# require_relative('../lib/model')

class Model
attr_accessor :date_of_interest, :case_count, :hospitalized_count, :death_count, 
:bx_case_count, :bx_hospitalized_count, :bx_death_count, 
:bk_case_count, :bk_hospitalized_count, :bk_death_count, 
:mn_case_count, :mn_hospitalized_count, :mn_death_count, 
:qn_case_count, :qn_hospitalized_count, :qn_death_count, 
:si_case_count, :si_hospitalized_count, :si_death_count
@@all = []
    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value)
        end
        save
    end 

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.find_by_date(date)
        @@all.find do |kase|
            kase.date_of_interest == date
            # binding.pry
        end
    end
   

end

