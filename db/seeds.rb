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


# CLEARING DB
User.destroy_all
puts "All Users deleted"
Exercice.destroy_all
puts "All Exercices deleted"
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
puts "#{User.count} users added"


# LOAD EXERICES FROM THE CSV FILE
CSV.foreach(csv_path, headers: :first_row, header_converters: :symbol) do |row|
  row[:user_id] = row[:user_id].to_i
  exercices << Exercice.new(row)
end
puts "All #{exercices.size} exercices loaded."

# ADD NON ALREADY EXISTANT EXERCICE IN EXERCICE DB
new_exercices = 0
json.each do |data|
  if Exercice.where(name: data["name"]).empty?
    data = data.transform_keys(&:to_sym)
    data.delete(:difficulty) if data.delete(:difficulty).present?
    exercice = Exercice.new(data)
    exercice.user = User.first
    new_exercices += 1
  end
end
"#{new_exercices} exercices added"



# USING API TO ADD EXERCICES TO THE CSV FILE
CSV.open(csv_path, "wb") do |row|
  row << header
  Exercice.all.each do |exercice|
    data = [
      exercice[:name],
      exercice[:type],
      exercice[:muscle],
      exercice[:equipment],
      exercice[:difficulty],
      exercice[:instructions],
      exercice[:user_id]
    ]
    row << data
  end
end


# Faker::Internet.email
# Faker::JapaneseMedia::Naruto.character

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
