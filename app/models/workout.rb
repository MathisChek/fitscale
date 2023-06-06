class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_sets
  has_many :trainings
end
