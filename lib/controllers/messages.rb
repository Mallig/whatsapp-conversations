require 'sinatra'
require 'json'
require './lib/models/message'

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
        blah = [
            [
                {
                    :sender_id => 1,
                    :receiver_id => 2,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 3,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 4,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 5,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 6,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 7,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 8,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 1,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 3,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 4,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 5,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 6,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 7,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 8,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 1,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 2,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 4,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 5,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 6,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 7,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 8,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 1,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 2,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 3,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 5,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 6,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 7,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 8,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 1,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 2,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 3,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 4,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 6,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 7,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 8,
                    :content => "Hi, I'm Neville longbottom"
                }
            ],
            [
                {
                    :sender_id => 1,
                    :receiver_id => 2,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 3,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 4,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 5,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 6,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 7,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 1,
                    :receiver_id => 8,
                    :content => "Hi, I'm Neville longbottom"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 1,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 3,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 4,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 5,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 6,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 7,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 2,
                    :receiver_id => 8,
                    :content => "S'all goo ma maaan"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 1,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 2,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 4,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 5,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 6,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 7,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 3,
                    :receiver_id => 8,
                    :content => "Yo ma g what's crackin'"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 1,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 2,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 3,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 5,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 6,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 7,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 4,
                    :receiver_id => 8,
                    :content => "Yo dawg, wassup ;)"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 1,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 2,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 3,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 4,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 6,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 7,
                    :content => "We all chill homie"
                },
                {
                    :sender_id => 5,
                    :receiver_id => 8,
                    :content => "We all chill homie"
                }
            ]
        ]
        blah.each do |message|
            Message.create(
                :sender_id => message[:sender_id],
                :receiver_id => message[:receiver_id],
                :content => message[:content]
            )
        end
        Message.all(:sender_id => params[:id]).to_json
    end
end
