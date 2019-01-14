require 'sinatra'
require "./lib/messages/message_controller"
require './lib/data_mapper_setup'

class WhatsAppConversations < Sinatra::Base
    use MessagesController

    before do
        response['Access-Control-Allow-Origin'] = '*'
        content_type 'application/json'
    end
    
    get "/" do
        "Hello World, from conversations API"
    end

    get "/:user_id/:other_user_id" do
        users = {  :sender_id => params[:user_id], :receiver_id => params[:other_user_id]  }

        messages = Message.all(:sender_id => users[:sender_id], :receiver_id => users[:receiver_id]) |
            Message.all(:sender_id => users[:receiver_id], :receiver_id => users[:sender_id])
        messages.to_json
    end
end
