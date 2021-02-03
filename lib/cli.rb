require 'pry'
require 'httparty'

require_relative('../lib/api')
# # require_relative('../lib/cli')
require_relative('../lib/model')
class Cli

    def welcome
        puts "\n"
        puts "Welcome!"
        puts "\n"
        puts "This app tracks COVID-19 cases in the NYC area."
        puts "\n"
        puts "The first recorded case in New York City was on 29/02/2020."
        Api.new.cases_by_date
        self.prompt_date
    end

    def prompt_date
        puts "\n"
        puts "Please enter date for when you would like COVID-19 case stats:"
        puts "\n"
        puts "Date format = mm/dd/yyyy"
        puts "\n"
        puts "To exit, type 'Exit'."
        input = gets.strip
            if input == "exit" || input == "Exit"
                self.exit_program
            else
        kase = Model.find_by_date(input)
        self.numbers_by_date(kase)
            end
    end

    def numbers_by_date(date)
        puts "\n"
        puts "The number of cases for #{date.date_of_interest} is: #{date.case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.hospitalized_count}."
        puts "The number of deaths with a positive molecular test for #{date.date_of_interest} is: #{date.death_count}."
        puts "\n"
        self.prompt_response
    end

    def prompt_response
        puts "Would you like to look into a different date?"
        puts "To exit the application, please type 'Exit'."
        input = gets.strip
            if input == "yes" || input ==  "Yes"
                self.prompt_date
            elsif input == "no" || input == "No" || input == "Exit" || input == "exit"
                self.exit_program
            else
                puts "Invalid answer. Please try again"
                self.prompt_response
            end

    end
    def invalid_date
        puts "There are no files for that date."
        puts "Please try again or type 'Exit' to exit application."
        self.prompt_date
    end
    def exit_program
        puts "Thank you visiting!"
        #ends program
        exit
    end
end