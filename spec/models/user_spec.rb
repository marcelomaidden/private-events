require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'username presence' do
    it 'if username not present' do
      u = User.new
      u.username = ''
      u.valid?
      expect(u.errors[:username]).to include("can't be blank")
    end

    it 'if username present' do
      u = User.new
      u.username = 'user'
      u.valid?
      expect(u.errors[:username]).to_not include("can't be blank")
    end
  end

  describe 'password presence' do
    it 'if password not present' do
      u = User.new
      u.password = ''
      u.valid?
      expect(u.errors[:password]).to include("can't be blank")
    end

    it 'if password present' do
      u = User.new
      u.password = 'pass'
      u.valid?
      expect(u.errors[:password]).to_not include("can't be blank")
    end
  end

  describe 'username and password presence' do
    it 'if both present' do
      expect(User.create!(username: 'user1', password: 'pass').valid?).to be true
    end
  end
end
