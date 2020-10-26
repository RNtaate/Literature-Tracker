require 'rails_helper'

RSpec.describe Group, type: :model do
  let!(:user){User.create!(name: 'user1', email: 'user1@something.com', password: '123456')}
  let!(:user2){User.create!(name: 'user2', email: 'user2@something.com', password: '123456')}
  context 'Validates the presence of name' do
    it 'Should be valid' do
      @group = Group.create(name: 'Educational', user_id: user.id)
      expect(@group.save).to be true
    end

    it 'Should not be valid' do
      @group = Group.create(name: '', user_id: user.id)
      expect(@group.save).not_to be true
    end
  end

  context 'Validates uniqueness of a group name' do
    it 'Should be valid' do
      @group1 = Group.create(name: 'Educational', user_id: user.id)
      @group2 = Group.create(name: 'Developmental', user_id: user2.id)
      
      expect(@group2.save).to be true
    end

    it 'Should not be valid' do
      @group1 = Group.create(name: 'Educational', user_id: user.id)
      @group2 = Group.create(name: 'Educational', user_id: user.id)
      
      expect(@group2.save).not_to be true
    end
  end

  context 'Association between group and book model' do
    it 'Enables user to assign many books to a group' do
      @group = Group.create!(name: 'Educational', user_id: user.id)

      @book1 = Book.create!(name: 'Thunder', author_id: user.id, book_author: 'Clouds', amount: 45, time: 3)
      @book2 = Book.create(name: 'Lightning', author_id: user.id, book_author: 'Clouds', amount: 45, time: 3)

      @group.books << @book1
      @group.books << @book2

      expect(@group.books.second.name).to eql('Lightning')
    end
  end
end