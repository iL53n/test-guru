class Badge < ApplicationRecord
  RULES = %w[category_complete level_complete first_attempt_complete].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  validates :title, presence: true

end