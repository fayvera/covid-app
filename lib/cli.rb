require 'pry'
require 'httparty'

require_relative('../lib/api')
# # require_relative('../lib/cli')
require_relative('../lib/model')
class Cli

    def welcome
        puts "Welcome!"
        puts "This app tracks COVID-19 cases in the NYC area."
        puts "The first recorded case in New York City was on 29/02/2020."
        Api.new.cases_by_date
        self.prompt_date
    end

    def prompt_date
        puts "Please enter date for when you would like COVID-19 case stats:"
        puts "Date format = mm/dd/yyyy"
        puts "To exit, type 'Exit'."
        input = gets.strip
        # new_case = Model.new(input)
        kase = Model.find_by_date(input)
        # Exit out of program
        self.numbers_by_date(kase)
    end

    def numbers_by_date(date)
        if date == 
        puts "The number of cases for #{date.date_of_interest} is: #{date.case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.hospitalized_count}."
        puts "The number of deaths with a positive molecular test for #{date.date_of_interest} is: #{date.death_count}."
        puts "Would you like to look into a different date?"
        self.prompt_response
    end

    def prompt_response
        input = gets.strip
        binding.pry
            if input == "yes" || input ==  "Yes"
                self.prompt_date
            elsif input == "no" || input == "No" 
                puts "To exit the application, please type 'Exit'."
                # Exit out of program 
            else
                puts "That selection was invalid, please try again or exit out of application."
                self.prompt_date
            end

    end
end