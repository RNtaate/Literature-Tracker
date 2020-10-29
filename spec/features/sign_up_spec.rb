require 'rails_helper'

RSpec.describe 'Sign up process', type: :feature do
  it 'Signs up a new user' do
    visit '/users/sign_in'
    click_link 'Sign up'
    fill_in 'user[name]', with: 'User1'
    fill_in 'user[email]', with: 'user1@something.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_button 'Sign up'
    expect(current_path).to eql(root_path)
  end
end
