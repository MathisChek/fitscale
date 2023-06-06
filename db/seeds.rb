KEY = "vEqmPDsSQJqKTpaOjrbwVg==88FJhtYQjvhNTufV"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
require 'net/http'
require 'json'
require 'rest-client'
require 'pry-byebug'

exercices = []
header = ["name", "nature", "muscle", "equipment", "instructions"]
csv_path = File.join(__dir__, 'exercices.csv')


# CLEARING DB
Exercice.destroy_all
puts "All Exercices deleted"
User.destroy_all
puts "All Users deleted"
Workout.destroy_all
puts "All Workouts deleted (WorkoutSets deleted too)"


# CREATING USERS
10.times do
  user = User.new(
    name: Faker::JapaneseMedia::Naruto.character,
    email: Faker::Internet.email,
    password: "azerty"
  )
  user.save
end
USERS = User.all
puts "#{User.count} users added"


# LOAD EXERICES FROM THE CSV FILE
CSV.foreach(csv_path, headers: :first_row, col_sep: '//', header_converters: :symbol) do |row|
  exo = Exercice.new(row)
  exo.user = USERS.sample
  exo.save
  exercices << exo
end
puts "#{Exercice.count} exercices loaded"

# ADD NON ALREADY EXISTANT EXERCICE IN EXERCICE DB
def query_new_exercices(option, section)
  new_exercices = 0
  url = "https://api.api-ninjas.com/v1/exercises?#{section}=#{option}"
  infos = JSON.parse(RestClient.get(url, headers={'X-Api-Key' => KEY}))
  infos.each do |data|
    if Exercice.where(name: data["name"]).empty?
      data = data.transform_keys(&:to_sym)
      data.delete(:difficulty) if data.has_key?(:difficulty)
      data[:nature] = data.delete :type if data.has_key?(:type)
      exercice = Exercice.new(data)
      exercice.user = USERS.sample
      exercice.save
      new_exercices += 1
    end
  end
  puts "#{new_exercices} exercices added from the API in section \"#{section}\" with option \"#{option}\""
end
puts "#{Exercice.count} exercices currently in the database "

# ITERATE ON VARIOUS OPTIONS OF THE API
type_options = ["cardio", "olympic_weightlifting", "plyometrics", "powerlifting", "strength", "stretching", "strongman"]
muscle_options = ["abdominals", "abductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "tricep"]
muscle_options[0..4].each { |opt| query_new_exercices(opt, "muscle") }

# USING API TO ADD EXERCICES TO THE CSV FILE
CSV.open(csv_path, "wb", col_sep: '//') do |row|
  row << header
  Exercice.all.each do |exercice|
    data = [
      exercice[:name],
      exercice[:nature],
      exercice[:muscle],
      exercice[:equipment],
      exercice[:instructions]
    ]
    row << data
  end
  "#{Exercice.count} exercices saved"
end
