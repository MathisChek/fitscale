class Rating < ApplicationRecord
  belongs_to :user, denpendent: :destroy
  belongs_to :exercice, dependent: :destroy

  validates :flexibility, presence: true
  validates :muscular_effort, presence: true
  validates :breath_difficulty, presence: true
  validates :user, presence: true
  validates :exercice, presence: true
end
