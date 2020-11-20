# rubocop:disable Layout/LineLength

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'name presence' do
    it 'if name not present' do
      u = Event.new
      u.name = ''
      u.valid?
      expect(u.errors[:name]).to include("can't be blank")
    end

    it 'if name present' do
      u = Event.new
      u.name = 'user'
      u.valid?
      expect(u.errors[:name]).to_not include("can't be blank")
    end
  end

  describe 'description presence' do
    it 'if description not present' do
      u = Event.new
      u.description = ''
      u.valid?
      expect(u.errors[:description]).to include("can't be blank")
    end

    it 'if description present' do
      u = Event.new
      u.description = 'user'
      u.valid?
      expect(u.errors[:description]).to_not include("can't be blank")
    end
  end

  describe 'date presence' do
    it 'if date not present' do
      u = Event.new
      u.date = ''
      u.valid?
      expect(u.errors[:date]).to include("can't be blank")
    end

    it 'if date present' do
      u = Event.new
      u.date = '2020-11-22
      18:42:00'
      u.valid?
      expect(u.errors[:date]).to_not include("can't be blank")
    end

    it 'if date present but wrong format' do
      u = Event.new
      u.date = 'asdf'
      u.valid?
      expect(u.errors[:date]).to include("can't be blank")
    end
  end

  describe 'all presence' do
    it 'if creator_id not present' do
      expect { Event.create!(name: 'event', description: 'description', date: '2020-11-22 18:42:00') }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Creator must exist')
    end

    it 'if all present' do
      User.create!(username: 'test1', password: 'pass')
      expect(Event.create!(name: 'event', description: 'description', date: '2020-11-22 18:42:00', creator_id: User.find(1).id).valid?).to be true
    end
  end
end

# rubocop:enable Layout/LineLength
