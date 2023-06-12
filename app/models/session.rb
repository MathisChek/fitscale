class Session < ApplicationRecord
  belongs_to :training

  def start_time
    self.programing_at ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def self.dates(user, date)
    user.sessions.find_all { |s| s.programing_at == date }
  end
end
