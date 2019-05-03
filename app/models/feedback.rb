class Feedback < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :messages, presence: true
end
