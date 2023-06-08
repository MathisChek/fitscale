class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_sets, dependent: :destroy
  has_many :exercices, through: :workout_sets
  has_many :trainings, dependent: :destroy

  def muscles
    array = []
    self.workout_sets.each do |wo_set|
      array << wo_set.exercice.muscle
    end
    array.uniq.sort
  end

  def fake_time
    self.workout_sets.map { |wo_set| wo_set.repetition }.sum
  end
end
