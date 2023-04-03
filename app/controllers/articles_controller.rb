class ArticlesController < ApplicationController
  def index
    render json: serializer.new(Article.all), status: :ok
  end

  def serializer 
    ArticleSerializer 
  end
end
