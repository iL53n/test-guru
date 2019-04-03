class Answer < ApplicationRecord

  MAX_ANSWERS = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_to_question, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_to_question
    errors.add(:question, 'can not have more than 4 answers') if question.answers.count >= MAX_ANSWERS
  end

  # def question_answers
  #   question.answers
  # end
end
