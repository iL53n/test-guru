class Feedback < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :message, presence: true
end
