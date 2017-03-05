require 'pry'
require 'httparty'
require 'json'

  
class Post

  attr_reader :title, :url, :name, :bio, :avatar_url

  def self.get_posts(tag)
    posts = []
    response = HTTParty.get("https://medium.com/_/api/tags/#{tag}/stream", headers: { 'Accept': 'application/json' })
    data = JSON.parse(response.body[16..-1])
    data["payload"]["references"]["Post"].each do |_k, v|

    author = data["payload"]["references"]["User"][v["creatorId"]]
    
    author["avatar_url"] = "https://cdn-images-1.medium.com/fit/c/200/200/#{author['imageId']}"

    ["type", "mediumMemberAt", "allowNotes", "backgroundImageId", "imageId"].each { |k| author.delete(k) }

    my_hash = {
      "title" => v["title"],
      "url" => "http://medium.com/@#{author['username']}/#{v["uniqueSlug"]}",
      "author_details" => author
    }
    posts << my_hash
  end
    return posts
  end

  def initialize(hash)
    @title = hash["title"]
    @url = hash["url"]
    @name = hash["author_details"]["name"] 
    @bio = hash["author_details"]["bio"]
    @avatar_url = hash["author_details"]["avatar_url"]
  end

end

#binding.pry



# p = Post.get_posts 'sparta-article'
# p[0]

# data = get_posts 'sparta-article'
# q
# data = get_posts 'sparta-article'
# q
# data = get_posts 'sparta-article'
# q
# data = get_posts 'sparta-article'
# q
# posts = get_posts('sparta-article')
# p = Post.new posts[0]
# p2 = Post.new posts[1]
# p1.title
# p.title
# p.author
# p.author_name
# p.name
# p.email
# p.url



