class Book < ApplicationRecord
  validates :name, presence: true

  has_many :book_groups, dependent: :destroy
  has_many :groups, through: :book_groups

  belongs_to :author, class_name: 'User'

  def self.ungrouped_books(current_user)
    @all_books = Book.where_id_is(current_user.id).includes(:groups)
    @books = []

    @all_books.each do |book|
      @books << book if book.groups.empty?
    end

    @books
  end

  def self.ungrouped_sum(current_user, column)
    sum = 0
    case column
    when 'amount'
      Book.ungrouped_books(current_user).each { |a| sum += a.amount }
    when 'time'
      Book.ungrouped_books(current_user).each { |a| sum += a.time }
    end
    sum
  end
end
