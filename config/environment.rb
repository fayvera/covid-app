require 'pry'
require 'httparty'
require 'colorize'
require 'sqlite3'

require_relative('../lib/api')
require_relative('../lib/cli')
require_relative('../lib/model')



DB = {:conn => SQLite3::Database.new('db/covid_cases.db')}