require 'spec_helper'
require 'spec_helpers/db_helper'

describe 'App' do
  def app
    WhatsAppConversations.new
  end

  describe 'GET /' do
    it 'connects successfully' do
      get '/'
      expect(last_response).to be_ok
    end

    it 'prints a welcome message' do
      get '/'
      expect(last_response.body).to eq "Hello World, from conversations API"
    end
  end

  describe 'GET /:user_id/:user_id' do
    before(:each) do
      migrate_messages_table
      populate_messages_table
      @get_messages_between_18_13 = JSON.parse(File.read('spec/mock_json/get_messages_between_18_13.json'))
    end

    it 'returns all messages between two users' do
      get '/18/13'
      expect(JSON.parse(last_response.body)).to match @get_messages_between_18_13
    end
  end
end
