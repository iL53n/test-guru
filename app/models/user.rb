class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true

  # def tests_by_level(level)
  #   Test.where(level: level).joins('INNER JOIN user_tests ON tests.id = user_tests.test_id').where(user_tests: {user_id: self.id})
  # end

  scope :tests_by_level, -> (level) { tests.where(level: level) }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end

