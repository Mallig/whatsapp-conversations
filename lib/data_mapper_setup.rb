require 'data_mapper'
require 'dm-postgres-adapter'
require './lib/models/conversation'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/whatsapp_conversations_#{ENV['RACK_ENV']}")
DataMapper.finalize
