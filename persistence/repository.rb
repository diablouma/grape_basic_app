
class Repository

  def initialize mongo_client
    @mongo_client = mongo_client
  end

  def all_posts
    cursor = @mongo_client[:posts].find()
    results = []
    cursor.each do |doc|
      results.push(doc)
    end
    return results
  end

  def insert collection, document
    @mongo_client[:posts].insert_one(document)
  end

  def delete_all collection
    @mongo_client[collection].drop
  end
end
