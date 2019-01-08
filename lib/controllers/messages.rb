require 'sinatra'
require 'json'
require './lib/models/message'

class MessagesController < Sinatra::Base

    before do
        content_type 'application/json'
    end

    post '/messages' do
        message = JSON.parse(request.body.read)
        new_or_existing_message = Message.create(
            :sender => message["sender"],
            :receiver => message["receiver"],
            :content => message["content"]
        )
        if new_or_existing_message.saved?
            return {
                :id => new_or_existing_message.id,
                :content => new_or_existing_message.content
            }.to_json
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
