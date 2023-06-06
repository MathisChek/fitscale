class Workout < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :workout_sets, dependent: :destroy
  has_many :trainings
end
