class WorkoutSet < ApplicationRecord
  belongs_to :workout, dependent: :destroy
  belongs_to :exercice
end
