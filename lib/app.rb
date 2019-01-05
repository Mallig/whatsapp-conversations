require 'sinatra'
require "./lib/controllers/conversations"
require './lib/data_mapper_setup'

class WhatsAppConversations < Sinatra::Base
    use ConversationsController
    get "/" do
        "Hello World, from conversations API"
    end
end
