require 'sinatra'
require "./lib/controllers/messages"
require './lib/data_mapper_setup'

class WhatsAppConversations < Sinatra::Base
    use MessagesController
    get "/" do
        "Hello World, from conversations API"
    end
end
