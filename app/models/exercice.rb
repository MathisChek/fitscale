class Exercice < ApplicationRecord
  belongs_to :user

  has_many :workout_sets, dependent: :destroy
  has_many :ratings, dependent: :destroy


  MUSCLES = ["abdominals", "abductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "tricep"]

  def self.search(query = nil)
    return self.all if query.nil?
    self.where("name ILIKE ?", "%#{query}%")
  end

end
