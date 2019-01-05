require 'data_mapper'
require './lib/models/message.rb'
class Conversation
    include DataMapper::Resource

    property :id,           Serial

    has n, :messages
end
