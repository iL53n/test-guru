class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, trought: :tests_passages

  validates :email, presence: true

  # def tests_by_level(level)
  #   Test.where(level: level).joins('INNER JOIN user_tests ON tests.id = user_tests.test_id').where(user_tests: {user_id: self.id})
  # end

  scope :tests_by_level, -> (level) { tests.where(level: level) }

end

