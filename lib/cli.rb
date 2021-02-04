require 'pry'
require 'httparty'

require_relative('../lib/api')
# # require_relative('../lib/cli')
require_relative('../lib/model')
class Cli

    def welcome
        puts ""
        puts "Welcome!"
        puts ""
        puts "This app tracks COVID-19 cases in the NYC area."
        puts ""
        puts "The first recorded case in New York City was on 29/02/2020."
        Api.new.cases_by_date
        self.prompt_date
    end

    def prompt_date
        puts ""
        puts "Please enter date for when you would like COVID-19 case stats:"
        puts ""
        puts "Date format = mm/dd/yyyy"
        puts ""
        puts "To exit, type 'Exit'."
        input = gets.strip
            if input == "exit" || input == "Exit"
                self.exit_program
            
            elsif
                kase = Model.find_by_date(input)
                self.numbers_by_date(kase)
            end
    end

    def numbers_by_date(date)
        puts ""
        puts "The number of positive cases for #{date.date_of_interest} is: #{date.case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.hospitalized_count}."
        puts "The number of deaths with a positive molecular test on #{date.date_of_interest} is: #{date.death_count}."
        puts ""
        self.prompt_response
    end

    def prompt_response
        puts "What would you like to do?"
        puts "1. Look at the numbers for a specific borough for this date."
        puts "2. Look into a different date?"
        puts "3. Exit the application, or type 'Exit'."
        input = gets.strip
            if input == "1"
                self.pick_borough
            elsif input == "2"
                self.prompt_date
            elsif input == "3" || input == "Exit" || input == "exit"
                self.exit_program
            # if input == "yes" || input ==  "Yes"
            #     self.prompt_date
            # else
            #     # puts "Invalid answer. Please try again"
            #     self.invalid_date
            # end

    end

    def invalid_date
        puts "Invalid response."
        puts "Please try again or type 'Exit' to exit application."
        self.prompt_date
    end
    def exit_program
        puts "Thank you visiting and stay safe!"
        #ends program
        exit
    end

    def pick_borough
        puts "Please pick a borough:"
        puts "1. Bronx"
        puts "2. Brooklyn"
        puts "3. Manhattan"
        puts "4. Queens"
        puts "5. Staten Island"
        puts "6. Select a new date"
        puts "7. Exit application"
        puts ""
        input = gets.strip
            if input == "1"
                self.borough_stats(bx)
            elsif input == "2"
                self.borough_stats(bk)
            elsif input == "3"
                self.borough_stats(mn)
            elsif input == "4"
                self.borough_stats(qn)
            elsif input == "5"
                self.borough_stats(si)
            elsif input == "6"
                self.prompt_date
            elsif input == "7" || input == "exit" || input == "Exit"
                self.exit_program
            else
                puts "Invalid response."
                puts "Please try again."
                self.pick_borough
            end
        end




    end
    def borough_stats(borough)
        puts ""
        puts "The number of positive cases for #{date.date_of_interest} is: #{date.case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.hospitalized_count}."
        puts "The number of deaths with a positive molecular test on #{date.date_of_interest} is: #{date.death_count}."
        puts ""
    end

end