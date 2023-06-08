class Exercice < ApplicationRecord
  belongs_to :user

  has_many :workout_sets, dependent: :destroy

  def self.search(query = nil)
    return self.all if query.nil?
    self.where("name ILIKE ?", "%#{query}%")
  end
end
