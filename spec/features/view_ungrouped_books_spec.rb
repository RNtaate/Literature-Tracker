require 'rails_helper'

RSpec.describe 'View ungrouped books', type: :feature do
  before :each do
    @user = User.create!(name: 'user1', email: 'user1@something.com',
                         password: '123456', password_confirmation: '123456')
  end
  it 'Creates an new book' do
    visit 'users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
    expect(current_path).to eql(root_path)

    click_link 'All my external books'
    expect(page).to have_content('UNGROUPED BOOKS')
  end
end
