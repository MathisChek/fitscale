class Session < ApplicationRecord
  belongs_to :training
  validate :not_past
  validates :programing_at, presence: true

  def start_time
    self.programing_at ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def self.dates(user, date)
    user.sessions.find_all { |s| s.programing_at == date }
  end

  HASH_SESSION_EXO = {
    Mon: 0,
    Tue: 0,
    Wed: 0,
    Thu: 0,
    Fri: 0,
    Sat: 0,
    Sun: 0
  }

  HASH_SESSION_RATING = {
    Mon: 0,
    Tue: 0,
    Wed: 0,
    Thu: 0,
    Fri: 0,
    Sat: 0,
    Sun: 0
  }

  private

  def not_past
    if programing_at.present? && programing_at < Date.today
      errors.add(:programing_at, "can't be in the past")
    end
  end
end
