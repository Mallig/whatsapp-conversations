require_relative '../../lib/data_mapper_setup'
require './lib/models/message'

def migrate_messages_table
  Message.auto_migrate!
end

def populate_messages_table
  messages_population.each do |message|
    Message.create(sender_id: message["sender_id"],
                   receiver_id: message["receiver_id"],
                   content: message["content"])
  end
end

def messages_population
  JSON.parse(File.read('./spec/spec_helpers/messages_population.json'))
end
