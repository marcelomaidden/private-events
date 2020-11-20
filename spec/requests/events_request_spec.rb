require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/events'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/events/1'
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/events/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'renders sign in if not' do
      get '/events/new'
      expect(response).to render_template(:sign_in)
    end

    it 'renders new template' do
      a = User.new(username: 'user1', password: 'password1')
      a.save
      session[:current_user] = User.find(1)
      get '/events/new'
      expect(response).to render_template(:new)
    end
  end
end
