require 'spec_helper'
require './spec/spec_helpers/db_helper'

describe 'Messages Controller' do
  before(:each) do
    migrate_messages_table
    populate_messages_table
    @get_messages_sent_by_18 = JSON.parse(File.read('spec/mock_json/get_messages_sent_by_18.json'))
  end

  def app
    MessagesController.new
  end

  describe 'GET /messages/:sender_id' do
    it 'connects successfully' do
      get '/messages/18'
      expect(last_response).to be_ok
    end

    it 'returns all messages with :sender_id value' do
      get '/messages/18'
      expect(JSON.parse(last_response.body)).to match @get_messages_sent_by_18
    end
  end
end
