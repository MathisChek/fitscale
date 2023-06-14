class Exercice < ApplicationRecord
  belongs_to :user

  has_many :workout_sets, dependent: :destroy
  has_many :ratings, dependent: :destroy

  MUSCLES = ["abdominals", "abductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "tricep"]

  def self.search(query = nil)
    return self.all if query.nil?
    sql_subquery = "name ILIKE :query OR muscle ILIKE :query"
    self.where(sql_subquery, query: "%#{query}%")
  end

  def str
    ratings = self.ratings
    (ratings.map { |rating| rating.muscular_effort }.sum / ratings.size.to_f).round(1)
  end

  def dex
    ratings = self.ratings
    (ratings.map { |rating| rating.flexibility }.sum / ratings.size.to_f).round(1)
  end

  def end
    ratings = self.ratings
    (ratings.map { |rating| rating.breath_difficulty }.sum / ratings.size.to_f).round(1)
  end
end
