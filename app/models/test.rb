class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy
  belongs_to :author, class_name: 'User', optional: true
  
  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than_or_equal_to: 0,
                                    only_integer: true }

  scope :tests_by_category, -> (category) { joins(:category).where(categories: { title: category }) }
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY)}

  def self.titles_by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
