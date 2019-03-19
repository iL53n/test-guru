class User < ApplicationRecord

  #has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users

  # def tests_by_level(level)
  #   Test.where(level: level).joins('INNER JOIN user_tests ON tests.id = user_tests.test_id').where(user_tests: {user_id: self.id})
  # end
end

