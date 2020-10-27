require 'rails_helper'

RSpec.describe 'Creates new book', type: :feature do
  before :each do
    @user = User.create!(name: 'user1', email: 'user1@something.com',
                         password: '123456', password_confirmation: '123456')
  end
  it 'Creates a new book' do
    visit 'users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
    expect(current_path).to eql(root_path)

    click_link 'All my books'
    click_link 'NEW BOOK'

    fill_in 'book[name]', with: 'Family and Friends'
    fill_in 'book[book_author]', with: 'Lucas'
    fill_in 'book[amount]', with: 10
    fill_in 'book[time]', with: 4

    click_button 'Create Book'

    expect(page).to have_content('Family and Friends')
  end
end
