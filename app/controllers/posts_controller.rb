class PostsController < ApplicationController

  def index
    data = Parser.new('posts',{page: "1",per_page:( "20")}).process 
    @posts = data[:post]
    @total_count = data[:count]
  end
end
