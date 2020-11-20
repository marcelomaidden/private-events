require 'rails_helper'

RSpec.describe 'the register process', type: :feature do
  before :each do
    User.new(username: 'user', password: 'password')
  end

  it 'register user' do
    visit '/users/new'
    within('.register-form') do
      fill_in 'Username', with: 'user'
      fill_in 'Password', with: 'password'
    end
    click_button 'Register'
    expect(current_path).to eq(user_path(1))
  end

  it 'render register form is not valid' do
    visit '/users/new'
    within('.register-form') do
      fill_in 'Username', with: ''
      fill_in 'Password', with: ''
    end
    click_button 'Register'
    expect(current_path).to eq('/users')
    expect(page).to have_content "can't be blank"
  end
end
