require 'mongo'

def get_client
  return Mongo::Client.new(['127.0.0.1:27017'], database: 'car_db')
end
