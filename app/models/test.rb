class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', optional: true

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than: 0,
                                    only_integer: true } # я думаю пригодится, чтобы могло быть только целочисленным

  # def self.tests_by_category(category)
  #   Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where(categories: {title: category}).order('tests.title DESC').pluck('tests.title')
  # end
  scope :tests_by_category, -> (category) { Test.joins(:category).where(categories: { title: category }) }
  scope :titles_by_category, -> (category) { tests_by_category(category).order(title: :desc).pluck(:title) } # <--

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY)}
end
