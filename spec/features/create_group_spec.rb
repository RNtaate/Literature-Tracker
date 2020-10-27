require 'rails_helper'

RSpec.describe 'Creates new group', type: :feature do
  before :each do
    @user = User.create!(name: 'user1', email: 'user1@something.com',
                         password: '123456', password_confirmation: '123456')
  end
  it 'Creates a new group' do
    visit 'users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
    expect(current_path).to eql(root_path)

    click_link 'All groups'
    click_link 'NEW GROUP'

    fill_in 'group[name]', with: 'Educational'

    click_button 'Create Group'

    expect(page).to have_content('Educational')
  end
end
