require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id,           Serial
  property :content,      String,     :required => true
  property :sender,       String,     :required => true
  property :receiver,     String,     :required => true

  belongs_to :conversation
end
