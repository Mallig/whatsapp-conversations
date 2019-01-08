require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id,             Serial
  property :content,        String,     :required => true
  property :sender_id,      Integer,     :required => true
  property :receiver_id,    Integer,     :required => true

end
