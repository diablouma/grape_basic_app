
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
end
