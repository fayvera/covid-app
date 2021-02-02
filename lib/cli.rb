class Cli

    def welcome
        puts "Welcome!"
        puts "This app tracks COVID-19 cases in the NYC area."
        prompt_date
    end

    def prompt_date
        puts "Please enter date for when you would like COVID-19 case stats:"
        puts "Date format = mm/dd/yyyy"
        input = gets.strip
        Api.cases_by_date
    end
end