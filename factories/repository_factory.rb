require './persistence/repository'
require 'mongo'

class RepositoryFactory
  def self.create_repository
    mongo_hosts = ['127.0.0.1:27017']
    db_name = 'blog_test'
    mongo_client = Mongo::Client.new(mongo_hosts, database: db_name)
    Repository.new mongo_client
  end
end
