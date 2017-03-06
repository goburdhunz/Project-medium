require 'sinatra'
require 'pry'
require './models/medium_arts.rb'

class App < Sinatra::Base

  get '/' do 
    @posts = Post.get_posts('big-data')
    erb :index
  end

end

  #  get '/' do
    
  # #   arts = Post.new

  # #   @posts =  @title = title
  # #             @name = name 
  # #             @bio =  bio
  # #             @url = url
  # #             @avatar_url = avatar_url
  #    erb :index
  #  end



# get '/index' do
#   @post = []
#   erb :index
# end



#   erb :index
#   end 
# get '/models/index' do
#   @ary = ['a','b','c']
#   erb :index
# end

# get '/views/index' do
#   @@post = []
#   erb :index
#  end
