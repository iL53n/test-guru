class User < ApplicationRecord

  def show_level_tests(level)
    Test.where(level: level)
  end
end
