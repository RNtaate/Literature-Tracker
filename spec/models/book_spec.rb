require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:user) { User.create!(name: 'user1', email: 'user1@something.com', password: '123456') }
  context 'Validates the presence of name' do
    it 'Should be valid' do
      @book = Book.create(name: 'Thunder', author_id: user.id, book_author: 'Clouds', amount: 45, time: 3)
      expect(@book.save).to be true
    end

    it 'Should not be valid' do
      @book = Book.create(name: '', author_id: user.id, book_author: 'Clouds', amount: 45, time: 3)
      expect(@book.save).not_to be true
    end
  end

  context 'Association between book and group model' do
    it 'Enables user to assign many groups to a book' do
      @book = Book.create!(name: 'Thunder', author_id: user.id, book_author: 'Clouds', amount: 45, time: 3)

      @group1 = Group.create!(name: 'Educational', user_id: user.id)
      @group2 = Group.create!(name: 'Developmental', user_id: user.id)

      @book.groups << @group1
      @book.groups << @group2

      expect(@book.groups.second.name).to eql('Developmental')
    end
  end
end
