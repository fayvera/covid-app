class Cli

    def welcome
        puts ""
        puts "Welcome!"
        puts ""
        puts "This app tracks COVID-19 cases in the NYC area."
        puts ""
        puts "The first recorded case in New York City was on 02/29/2020."
        puts ""
        puts "The last recorded case on file in New York City was on 12/03/2020."
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
        puts ""
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
        puts "The number of positive cases for #{"#{date.date_of_interest}".light_blue} is: #{"#{date.case_count}".red}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.hospitalized_count}".red}."
        puts "The number of deaths with a positive molecular test on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.death_count}".red}."
        puts ""
        self.prompt_response(date)
    end

    def prompt_response(date)
        puts "What would you like to do?"
        puts "#{"1.".green} Look at the numbers for a specific borough for this date."
        puts "#{"2.".green} Look into a different date?"
        puts "#{"3.".yellow} Exit the application, or type 'Exit'."
        puts ""
        input = gets.strip
            if input == "1" || input == "1."
                self.pick_borough(date)
            elsif input == "2" || input == "2."
                self.prompt_date
            elsif input == "3" || input == "3." || input == "Exit" || input == "exit"
                self.exit_program
            else
                puts "#{"Invalid response.".yellow}"
                puts "#{"Please try again.".yellow}"
                self.prompt_response
            end
    end

    def invalid_date
        puts "Invalid response."
        puts "Please try again or type 'Exit' to exit application."
        puts ""
        self.prompt_date
    end

    def exit_program
        puts ""
        puts "Thank you visiting and stay safe!"
        puts ""
        exit
    end

    def pick_borough(date)
        puts "Please pick a borough:"
        puts "#{"1.".green} Bronx"
        puts "#{"2.".green} Brooklyn"
        puts "#{"3.".green} Manhattan"
        puts "#{"4.".green} Queens"
        puts "#{"5.".green} Staten Island"
        puts "#{"6.".green} Select a new date"
        puts "#{"7.".green} Select a new Borough"
        puts "#{"8.".yellow} Exit application"
        puts ""
        input = gets.strip
        # Model.
            if input == "1" || input == "1." 
                self.bronx_stats(date)
                # self.stats(date, "Bronx", )
            elsif input == "2" || input == "2." 
                self.brooklyn_stats(date)
            elsif input == "3" || input == "3." 
                self.manhattan_stats(date)
            elsif input == "4" || input == "4." 
                self.queens_stats(date)
            elsif input == "5" || input == "5." 
                self.staten_island_stats(date)
            elsif input == "6" || input == "6." 
                self.prompt_date
            elsif input == "7" || input == "7." 
                self.pick_borough(date)
            elsif input == "8" || input == "8." || input == "exit" || input == "Exit"
                self.exit_program
            else
                puts "#{"Invalid response.".yellow}"
                puts "#{"Please try again.".yellow}"
                self.pick_borough(date)
            end
    end


    def bronx_stats(date)
        puts ""
        puts "The number of positive cases for #{"#{date.date_of_interest}".light_blue} in Bronx is: #{"#{date.bx_case_count}".red}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.bx_hospitalized_count}".red}."
        puts "The number of deaths with a positive molecular test on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.bx_death_count}".red}."
        puts ""
        self.pick_borough(date)
    end
    def brooklyn_stats(date)
        puts ""
        puts "The number of positive cases for #{"#{date.date_of_interest}".light_blue} in Brooklyn is: #{"#{date.bk_case_count}".red}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.bk_hospitalized_count}".red}."
        puts "The number of deaths with a positive molecular test on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.bk_death_count}".red}."
        puts ""
        self.pick_borough(date)

    end
    def manhattan_stats(date)
        puts ""
        puts "The number of positive cases for #{"#{date.date_of_interest}".light_blue} in Manhattan is: #{"#{date.mn_case_count}".red}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.mn_hospitalized_count}".red}."
        puts "The number of deaths with a positive molecular test on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.mn_death_count}".red}."
        puts ""
        self.pick_borough(date)
    end
    def queens_stats(date)
        puts ""
        puts "The number of positive cases for #{"#{date.date_of_interest}".light_blue} in Queens is: #{"#{date.qn_case_count}".red}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.qn_hospitalized_count}".red}."
        puts "The number of deaths with a positive molecular test on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.qn_death_count}".red}."
        puts ""
        self.pick_borough(date)
    end
    def staten_island_stats(date)
        puts ""
        puts "The number of positive cases for #{"#{date.date_of_interest}".light_blue} in Staten Island is: #{"#{date.si_case_count}".red}."
        puts "The number of people hospitalized within 14 days of diagnosis on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.si_hospitalized_count}".red}."
        puts "The number of deaths with a positive molecular test on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.si_death_count}".red}."
        puts ""
        self.pick_borough(date)
    end

    # def stats(date, borough, count)
    #     puts ""
    #     puts "The number of positive cases for #{"#{date.date_of_interest}".light_blue} in #{borough} is: #{"#{date.si_case_count}".red}."
    #     puts "The number of people hospitalized within 14 days of diagnosis on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.si_hospitalized_count}".red}."
    #     puts "The number of deaths with a positive molecular test on #{"#{date.date_of_interest}".light_blue} is: #{"#{date.si_death_count}".red}."
    #     puts ""
    #     self.pick_borough(date)
    # end


end