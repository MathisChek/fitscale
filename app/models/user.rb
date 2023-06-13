class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :workouts, dependent: :destroy
  has_many :exercices, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :trainings, dependent: :destroy
  has_many :sessions, through: :trainings, dependent: :destroy

  def week_sessions
    # recuperer les sessions de la semaine en cours
    actual_week = Date.today.cweek
    actual_sessions = []
    self.sessions.each do |session|
      session.programing_at.cweek == actual_week ? actual_sessions << session : nil
    end
    return actual_sessions
  end
end
