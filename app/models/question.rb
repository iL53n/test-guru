class Question < ApplicationRecord

  ANSWERS = (1..4).freeze

  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_amt_answers

  private

  def validate_amt_answers
    errors.add(:answers) if answers.size != ANSWERS
  end
end
