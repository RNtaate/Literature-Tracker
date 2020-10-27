require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validates presence of a name' do
    it 'Should be valid' do
      @user = User.create(name: 'user1', email: 'user1@something.com',
                          password: '123456', password_confirmation: '123456')
      expect(@user.save).to be true
    end

    it 'should not be valid' do
      @user = User.create(name: '', email: 'user1@something.com',
                          password: '123456', password_confirmation: '123456')
      expect(@user.save).not_to be true
    end
  end

  context 'Association between user and group model' do
    it 'Enables user to create many groups' do
      @user = User.create!(name: 'user1', email: 'user1@something.com',
                           password: '123456', password_confirmation: '123456')
      @user.groups.create(name: 'Educational')
      @user.groups.create(name: 'Developmental')
      expect(Group.second.user.name).to eql(@user.name)
    end
  end

  context 'Association between user and book model' do
    it 'Enables user to create many books' do
      @user = User.create!(name: 'user1', email: 'user1@something.com',
                           password: '123456', password_confirmation: '123456')
      @user.books.create(name: 'Lightning', book_author: 'clouds', amount: 45, time: 4)
      @user.books.create(name: 'Thunder', book_author: 'clouds', amount: 45, time: 4)
      expect(Book.second.author.name).to eql(@user.name)
    end
  end
end
