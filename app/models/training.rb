class Training < ApplicationRecord
  belongs_to :workout, dependent: :destroy
  belongs_to :user
end
