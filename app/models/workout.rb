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
    array.sort
  end

  def fake_time
    self.workout_sets.map { |wo_set| wo_set.repetition }.sum
  end

  def avg_str
    array = []
    self.exercices.each do |exo|
      exo.ratings.each do |rate|
        array << rate.muscular_effort
      end
    end
    (array.sum / array.size.to_f).round(1)
  end

  def avg_dex
    array = []
    self.exercices.each do |exo|
      exo.ratings.each do |rate|
        array << rate.flexibility
      end
    end
    (array.sum / array.size.to_f).round(1)
  end

  def avg_end
    array = []
    self.exercices.each do |exo|
      exo.ratings.each do |rate|
        array << rate.breath_difficulty
      end
    end
    (array.sum / array.size.to_f).round(4)
  end

  def score
    ((self.avg_dex + self.avg_str + self.avg_end) / 3).round(1)
  end

  def muscle_hash
    hash = {}
    Exercice::MUSCLES.each do |element|
      nbr = self.muscles.count(element)
      hash[element.to_sym] = nbr unless nbr == 0
    end
    return hash
  end

end
