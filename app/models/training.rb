class Training < ApplicationRecord
  belongs_to :workout
  belongs_to :user

  has_many :sessions, dependent: :destroy
  validates :user_id, presence: true, uniqueness: { scope: :workout_id }
  validates :workout_id, presence: true

  def wo_name
    "#{self.workout.score} - #{self.workout.name} - type: #{self.workout.focus[0]}"
  end
end
