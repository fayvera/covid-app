require 'pry'
require 'httparty'

require_relative('../lib/api')
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
            else
                puts "Invalid option."
                puts "Please pick again."
                self.prompt_date
            end
            
    end

    def numbers_by_date(date)
        puts ""
        puts "The number of positive cases for #{date.date_of_interest} is: #{date.case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.hospitalized_count}."
        puts "The number of deaths with a positive molecular test on #{date.date_of_interest} is: #{date.death_count}."
        puts ""
        self.prompt_response(date)
    end

    def prompt_response(date)
        puts "What would you like to do?"
        puts "1. Look at the numbers for a specific borough for this date."
        puts "2. Look into a different date?"
        puts "3. Exit the application, or type 'Exit'."
        input = gets.strip
            if input == "1"
                self.pick_borough(date)
            elsif input == "2"
                self.prompt_date
            elsif input == "3" || input == "Exit" || input == "exit"
                self.exit_program
            else
                puts "Invalid response."
                puts "Please try again."
                self.prompt_response
            end
    end

    def invalid_date
        puts "Invalid response."
        puts "Please try again or type 'Exit' to exit application."
        self.prompt_date
    end

    def exit_program
        puts "Thank you visiting and stay safe!"
        exit
    end

    def pick_borough(date)
        puts "Please pick a borough:"
        puts "1. Bronx"
        puts "2. Brooklyn"
        puts "3. Manhattan"
        puts "4. Queens"
        puts "5. Staten Island"
        puts "6. Select a new date"
        puts "7. Select a new Borough"
        puts "8. Exit application"
        puts ""
        input = gets.strip
            if input == "1"
                self.bronx_stats(date)
            elsif input == "2"
                self.brooklyn_stats(date)
            elsif input == "3"
                self.manhattan_stats(date)
            elsif input == "4"
                self.queens_stats(date)
            elsif input == "5"
                self.staten_island_stats(date)
            elsif input == "6"
                self.prompt_date
            elsif input == "7"
                self.pick_borough
            elsif input == "8" || input == "exit" || input == "Exit"
                self.exit_program
            else
                puts "Invalid response."
                puts "Please try again."
                self.pick_borough
            end
    end


    def bronx_stats(date)
        puts ""
        puts "The number of positive cases for #{date.date_of_interest} in Bronx is: #{date.bx_case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.bx_hospitalized_count}."
        puts "The number of deaths with a positive molecular test on #{date.date_of_interest} is: #{date.bx_death_count}."
        puts ""
        self.pick_borough(date)
    end
    def brooklyn_stats(date)
        puts ""
        puts "The number of positive cases for #{date.date_of_interest} in Brooklyn is: #{date.bk_case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.bk_hospitalized_count}."
        puts "The number of deaths with a positive molecular test on #{date.date_of_interest} is: #{date.bk_death_count}."
        puts ""
        self.pick_borough(date)

    end
    def manhattan_stats(date)
        puts ""
        puts "The number of positive cases for #{date.date_of_interest} in Manhattan is: #{date.mn_case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.mn_hospitalized_count}."
        puts "The number of deaths with a positive molecular test on #{date.date_of_interest} is: #{date.mn_death_count}."
        puts ""
        self.pick_borough(date)
    end
    def queens_stats(date)
        puts ""
        puts "The number of positive cases for #{date.date_of_interest} in Queens is: #{date.qn_case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.qn_hospitalized_count}."
        puts "The number of deaths with a positive molecular test on #{date.date_of_interest} is: #{date.qn_death_count}."
        puts ""
        self.pick_borough(date)
    end
    def staten_island_stats(date)
        puts ""
        puts "The number of positive cases for #{date.date_of_interest} in Staten Island is: #{date.si_case_count}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{date.date_of_interest} is: #{date.si_hospitalized_count}."
        puts "The number of deaths with a positive molecular test on #{date.date_of_interest} is: #{date.si_death_count}."
        puts ""
        self.pick_borough(date)
    end



end