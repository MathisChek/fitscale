class Exercice < ApplicationRecord
  belongs_to :user

  has_many :workout_sets, dependent: :destroy

  MUSCLES = ["abdominals", "abductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "tricep"]
end
