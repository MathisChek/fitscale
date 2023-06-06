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

exercices = []
header = ["name", "type", "muscle", "equipment", "difficulty", "instructions"]
csv_path = File.join(__dir__, 'exercices.csv')

KEY = "vEqmPDsSQJqKTpaOjrbwVg==88FJhtYQjvhNTufV"
url = "https://api.api-ninjas.com/v1/exercises?"
json = JSON.parse(RestClient.get(url, headers={'X-Api-Key' => KEY}))

# {"name"=>"Jumping rope",
#  "type"=>"cardio",
#   "muscle"=>"quadriceps",
#   "equipment"=>"body_only",
#   "difficulty"=>"intermediate",
#   "instructions"=>  "Hold an end of the rope in each hand. Position the rope behind you on the ground.
#                     Raise your arms up and turn the rope over your head bringing it down in front of you.
#                     When it reaches the ground, jump over it. Find a good turning pace that can be maintained.
#                     Different speeds and techniques can be used to introduce variation.
#                     Rope jumping is exciting, challenges your coordination, and requires a lot of energy.
#                     A 150 lb person will burn about 350 calories jumping rope for 30 minutes,
#                     compared to over 450 calories running."}



CSV.foreach(csv_path, headers: :first_row, header_converters: :symbol) do |row|
  exercices << Exercice.new(row)
end



CSV.open(csv_path, "wb") do |row|
  new_exercices  new exercices added != 0
  row << header
  json.each do |element|
    if Exercice.where(name: element["name"]).
      array = [
        element["name"],
        element["type"],
        element["muscle"],
        element["equipment"],
        element["difficulty"],
        element["instructions"]
      ]
      row << array
      new_exercices  new exercices added !+= 1
    end
  end
  "#{new_exercices} new exercices added !"
end



# Faker::JapaneseMedia::Naruto.character
