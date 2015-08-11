
class Repository

  def initialize mongo_client
    @mongo_client = mongo_client
  end

  def all collection
    cursor = @mongo_client[collection].find
    results = []
    cursor.each do |doc|
      results.push doc
    end
    return results
  end

  def insert collection, document
    @mongo_client[collection].insert_one document
  end

  def delete_all collection
    @mongo_client[collection].drop
  end
end
