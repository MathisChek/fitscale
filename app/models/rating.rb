class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :exercice

  validates :flexibility, presence: true
  validates :muscular_effort, presence: true
  validates :breath_difficulty, presence: true
  validates :user, presence: true
  validates :exercice, presence: true
end
