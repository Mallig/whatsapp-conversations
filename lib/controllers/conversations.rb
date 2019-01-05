require 'sinatra'
require 'json'
require './lib/models/conversation'

class ConversationsController < Sinatra::Base

    before do
        content_type 'application/json'
    end

    get '/conversations' do
        Conversation.all.to_json
    end

    post '/conversations' do
        conversation = JSON.parse(request.body.read)
        new_or_existing_conversation = Conversation.create(
            :username => conversation["username"],
            :password => conversation["password"]
        )
        if new_or_existing_conversation.saved?
            return {
                :id => new_or_existing_conversation.id,
                :username => new_or_existing_conversation.username
            }.to_json
        else
            {:saved => false}.to_json 
        end
    end

    delete '/conversations/:id' do
        id = params[:id]
        conversation = Conversation.first(:id => id)
        conversation.destroy.to_json
    end
    
    get '/conversations/:id' do
        Conversation.first(:id => params[:id]).to_json
    end
end
