require 'data_mapper'
require 'dm-postgres-adapter'
require './lib/messages/message'

DataMapper::Logger.new($stdout, :debug) unless ENV['RACK_ENV'] == 'test'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/whatsapp_conversations_#{ENV['RACK_ENV']}")
DataMapper.finalize
