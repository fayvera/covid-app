require 'pry'
require 'httparty'

require_relative('../lib/api')
require_relative('../lib/cli')
# require_relative('../lib/model')



class Model
attr_accessor :date_of_interest, :case_count, :hospitalized_count, :death_count

    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value)
        end
    end 


 
end