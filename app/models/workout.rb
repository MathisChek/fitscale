class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_sets, dependent: :destroy
  has_many :exercices, through: :workout_sets
  has_many :trainings, dependent: :destroy
end
