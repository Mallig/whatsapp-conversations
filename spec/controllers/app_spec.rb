require 'spec_helper'

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
end
