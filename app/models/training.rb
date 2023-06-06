class Training < ApplicationRecord
  belongs_to :workout_id
  belongs_to :user_id
end
