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
        messages = []
        users = [{  :sender_id => params[:user_id], :receiver_id => params[:other_user_id]  },
                 {  :sender_id => params[:other_user_id], :receiver_id => params[:user_id]  }]
        users.each do |user|
            messages.push(Message.all(:sender_id => user[:sender_id], :receiver_id => user[:receiver_id]))
        end

        messages.to_json
    end
end
