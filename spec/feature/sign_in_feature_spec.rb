require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
  before :each do
    User.create(username: 'user', password: 'password')
  end

  it 'signs me in' do
    visit '/sign_in'
    within('.login-form') do
      fill_in 'Username', with: 'user'
      fill_in 'Password', with: 'password'
    end
    click_button 'Login'
    expect(current_path).to eq(root_path)
  end

  it 'render sign in form if not valid' do
    visit '/sign_in'
    within('.login-form') do
      fill_in 'Username', with: 'user'
      fill_in 'Password', with: '0'
    end
    click_button 'Login'
    expect(current_path).to eq(sign_in_path)
  end
end
