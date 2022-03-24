require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Hamid', email: 'machipisajunior@mail.com', password: '123456') }
  let(:group) { user.groups.create(name: 'Transport', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaKTCERY75vBXcd1Hc4-fDXXoePpfkWPEjqQ&usqp=CAU', user_id: user.id) }
  describe 'GET /index' do
    before do
      sign_in user
      get user_groups_path(user.id)
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get user_groups_path(user.id)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
