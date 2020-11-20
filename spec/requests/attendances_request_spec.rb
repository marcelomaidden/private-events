require 'rails_helper'

RSpec.describe 'Attendances', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      User.new(username: 'user1', password: 'pass').save
      Event.new(name: 'event', description: 'desc', date: '2020-11-22 18:42:00',creator_id: 1).save
      user = User.find(1)
      event = Event.find(1)
      get '/attendances/create', params: { user: user.username, user_id: user.id, event_id: event.id }
      expect { response }.to raise_error(TypeError)
    end
  end
end
