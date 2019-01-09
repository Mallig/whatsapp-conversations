require 'sinatra'
require "./lib/controllers/messages"
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
        user_messages = Message.all(:sender_id => params[:user_id],
                                    :receiver_id => params[:other_user_id])
        other_user_messages = Message.all(:sender_id => params[:other_user_id],
                                          :receiver_id => params[:user_id])
        messages = user_messages + other_user_messages
        messages.to_json
    end
end
