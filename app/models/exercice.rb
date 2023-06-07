class Exercice < ApplicationRecord
  belongs_to :user

  has_many :workout_sets, dependent: :destroy
end
