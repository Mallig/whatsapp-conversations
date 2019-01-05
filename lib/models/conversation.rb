require 'data_mapper'
class Conversation
    include DataMapper::Resource

    property :id,           Serial

    has n, :messages
end

class Messages
  include DataMapper::Resource

  property :id,           Serial
  property :content,      String,     :required => true
  property :sender,       String,     :required => true
  property :receiver,     String,     :required => true

  belongs_to :conversation
end
