class Category < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 20}
  validates_uniqueness_of :name, case_sensitive: false
  has_many :article_categories
  has_many :articles, through: :article_categories
end