class Book < ApplicationRecord

  validates :name, presence: true

  has_many :book_groups
  has_many :groups, through: :book_groups

  has_many :authors
end
