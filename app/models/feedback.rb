class Feedback < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true

  validates :title, presence: true
  validates :messages, presence: true
end
