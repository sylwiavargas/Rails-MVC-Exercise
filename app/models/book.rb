class Book < ApplicationRecord
  has_many :queries, :dependent => :delete_all
  has_many :authors, through: :queries

  validates :pages, presence: true
  validates :title, presence: true 
end
