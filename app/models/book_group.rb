class BookGroup < ApplicationRecord
  belongs_to :group
  belongs_to :book
end
