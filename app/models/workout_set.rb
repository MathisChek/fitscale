class WorkoutSet < ApplicationRecord
  belongs_to :workout_id
  belongs_to :exercice_id
end
