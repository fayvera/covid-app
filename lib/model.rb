require 'pry'
require 'httparty'

require_relative('../lib/api')
require_relative('../lib/cli')
# require_relative('../lib/model')



class Model
attr_accessor :date_of_interest, :case_count, :hospitalized_count, :death_count
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
        end
    end
end

# Model.find_by_date(date)