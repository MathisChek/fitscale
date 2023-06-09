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

  def avg_str
    exercices = self.workout_sets
    (exercices.map { |wo_set| wo_set.exercice.str }.sum / exercices.size).round(1)
  end
  def avg_dex
    exercices = self.workout_sets
    (exercices.map { |wo_set| wo_set.exercice.dex }.sum / exercices.size).round(1)
  end
  def avg_end
    exercices = self.workout_sets
    (exercices.map { |wo_set| wo_set.exercice.end }.sum / exercices.size).round(1)
  end
  def score
    ((self.avg_dex + self.avg_str + self.avg_end) / 3).round(1)
  end
end
