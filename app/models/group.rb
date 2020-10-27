class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_one_attached :image

  has_many :book_groups, dependent: :destroy
  has_many :books, through: :book_groups

  belongs_to :user

  validates :image, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'],
                                    message: 'must be (png, jpg or jpeg)' }

  validates :image, size: { less_than: 5.megabytes, message: 'must be less than 5 MB' }
end
