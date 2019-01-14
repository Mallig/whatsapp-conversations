require 'sinatra'
require 'json'
require './lib/messages/message'

class MessagesController < Sinatra::Base

    before do
        response['Access-Control-Allow-Origin'] = '*'
        content_type 'application/json'
    end

    post '/messages' do
        message = JSON.parse(request.body.read)
        new_or_existing_message = Message.create(
            :sender_id => message["sender_id"],
            :receiver_id => message["receiver_id"],
            :content => message["content"]
        )
        if new_or_existing_message.saved?
            new_or_existing_message.to_json
        else    
            {:saved => false}.to_json 
        end
    end

    delete '/messages/:id' do
        id = params[:id]
        message = Message.first(:id => id)
        message.destroy.to_json
    end
    
    get '/messages/:id' do
        Message.all(:sender_id => params[:id]).to_json
    end
end
