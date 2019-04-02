class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', optional: true

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than: 0,
                                    only_integer: true }

  scope :tests_by_category, -> (category) { joins(:category).where(categories: { title: category }) }
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY)}

  def self.titles_by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
