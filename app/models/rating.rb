class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :exercice

  validates :flexibility, presence: true, numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 0 }
  validates :muscular_effort, presence: true, numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 0 }
  validates :breath_difficulty, presence: true, numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 0 }
  validates :user, presence: true
  validates :exercice, presence: true
end
