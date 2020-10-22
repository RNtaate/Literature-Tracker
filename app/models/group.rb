class Group < ApplicationRecord
  validates :name, presence: true

  has_one_attached :image

  has_many :book_groups
  has_many :books, through: :book_groups

  belongs_to :user
end
