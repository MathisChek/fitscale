class Training < ApplicationRecord
  belongs_to :workout
  belongs_to :user

  has_many :sessions, dependent: :destroy
end
