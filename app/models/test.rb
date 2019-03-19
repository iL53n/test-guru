class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', optional: true

  def self.tests_by_category(category)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where(categories: {title: category}).order('tests.title DESC').pluck('tests.title')
  end
end
