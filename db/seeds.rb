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
Workout.destroy_all
WorkoutSet.destroy_all
puts "All Workouts deleted (WorkoutSets deleted too)"
User.destroy_all
puts "All Users deleted"
Exercice.destroy_all
puts "All Exercices deleted"



# CREATING USERS
15.times do
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
      if exercice.save
        new_exercices += 1
        exercices << exercice
      end
    end
  end
  puts "#{new_exercices} Exercices added from the API in section \"#{section}\" with option \"#{option}\""
end

# ITERATE ON VARIOUS OPTIONS OF THE API
type_options = ["cardio", "olympic_weightlifting", "plyometrics", "powerlifting", "strength", "stretching", "strongman"]
muscle_options = ["abdominals", "abductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "tricep"]
muscle_options[0..1].each { |opt| query_new_exercices(opt, "muscle") }
puts "#{Exercice.count} Exercices currently in the database"
EXERCICES = Exercice.all

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
  puts "#{Exercice.count} Exercices saved"
end


# GENERATING WORKOUTS AND WORKOUTS SET
number_of_workouts = 5
number_of_workoutsets = rand(4..16)

number_of_workouts.times do
  workout = Workout.new(
    name: Faker::JapaneseMedia::Naruto.eye,
    description: Faker::JapaneseMedia::StudioGhibli.quote
  )
  workout.user = USERS.sample
  workout.save
  number_of_workoutsets.times do
    workout_set = WorkoutSet.new(
      repetition: rand(6..16)
    )
    workout_set.workout = workout
    workout_set.exercice = EXERCICES.sample
    workout_set.save
  end
end
WORKOUTS = Workout.all
puts "#{Workout.count} Workouts created"
puts "#{WorkoutSet.count} WorkoutSets created"

# GENERATING TRAININGS and SESSIONS
number_of_trainings = rand(2..6)
number_of_users = 5

USERS.sample(number_of_users).each do |user|
  number_of_trainings.times do
    training = Training.new
    workout = WORKOUTS.sample
    training.user = user
    training.workout = workout
    if training.save
      session = Session.new(
        programing_at: Date.today + rand(1..100).day
      )
      session.training = training
      session.save
    end
  end
end

puts "#{Training.count} Trainings created"
puts "#{Session.count} Sessions created"
