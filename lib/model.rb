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
        end
    end

    # def self.all_models
    #     @@all.sort do |a, b|
    #         a.case_count <=> b.case_count
    #     end
    # end

    def self.create_table
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS models (
            id INTEGER PRIMARY KEY,
            date_of_interest TEXT, case_count INTEGER, hospitalized_count INTEGER, death_count INTEGER, 
bx_case_count INTEGER, bx_hospitalized_count INTEGER, bx_death_count INTEGER, 
bk_case_count INTEGER, bk_hospitalized_count INTEGER, bk_death_count INTEGER, 
mn_case_count INTEGER, mn_hospitalized_count INTEGER, mn_death_count INTEGER, 
qn_case_count INTEGER, qn_hospitalized_count INTEGER, qn_death_count INTEGER, 
si_case_count INTEGER, si_hospitalized_count INTEGER, si_death_count INTEGER
        )
        SQL
        DB[:conn].execute(sql)
    end

end

