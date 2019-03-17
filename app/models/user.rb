class User < ApplicationRecord

  def show_level_tests(level)
    Test.where(level: level).joins('INNER JOIN user_tests ON tests.id = user_tests.test_id').where(user_tests: {user_id: self.id})
  end
end

