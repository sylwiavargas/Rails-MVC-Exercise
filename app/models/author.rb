class Author < ApplicationRecord
  has_many :queries, :dependent => :delete_all
  has_many :books, through: :queries

  validates :name, presence: true
  validates :birth_year, presence: true, numericality: {less_than_or_equal_to: Time.now.year}
end
