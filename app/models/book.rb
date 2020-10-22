class Book < ApplicationRecord
  has_many :book_groups
  has_many :groups, through: :book_groups
end
