class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_sets, dependent: :destroy
  has_many :exercices, through: :workout_sets
  has_many :trainings, dependent: :destroy

  has_one_attached :photo

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
    sum = (array.sum / array.size.to_f).round(1)
    sum.nan? ? 0 : sum
  end

  def avg_dex
    array = []
    self.exercices.each do |exo|
      exo.ratings.each do |rate|
        array << rate.flexibility
      end
    end
    sum = (array.sum / array.size.to_f).round(1)
    sum.nan? ? 0 : sum
  end

  def avg_end
    array = []
    self.exercices.each do |exo|
      exo.ratings.each do |rate|
        array << rate.breath_difficulty
      end
    end
    sum = (array.sum / array.size.to_f).round(1)
    sum.nan? ? 0 : sum
  end

  def score
    score = ((self.avg_dex + self.avg_str + self.avg_end) / 3).round(1)
  end

  def muscle_hash
    hash = {}
    Exercice::MUSCLES.each do |element|
      nbr = self.muscles.count(element)
      hash[element.to_sym] = nbr unless nbr == 0
    end
    return hash
  end

  def focus
    if self.avg_str > self.avg_dex && self.avg_str > self.avg_end
      return ["Muscular Effort", "#FD1015", "rgba(255,16,0,1)"]
    elsif self.avg_dex > self.avg_end
      return ["Flexibility", "#1ED584", "rgba(65,255,0,1)"]
    else
      return ["Breath Difficulty", "#73BBC9", "rgba(0,129,255,1)"]
    end
  end

  def styling
    {
      str: {
        value: self.avg_str,
        color: "rgba(255,16,0,1)"
      },
      end: {
        value: self.avg_end,
        color: "rgba(0,129,255,1)"
      },
      dex: {
        value: self.avg_dex,
        color: "rgba(65,255,0,1)"
      }
    }
  end
end
