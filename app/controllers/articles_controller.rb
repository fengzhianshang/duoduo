class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: { status: 200, articles: articles }.to_json
  end

  def create
    article = Article.create(article_params)
    render json: { status: 200, article: article }.to_json
  end

  def update
    article = Article.find(params[:id])
    article.title = article_params[:title]
    article.body = article_params[:body]
    article.update_attributes!(article_params)
    render json: { status: 200, article: article }
  end

  def destroy
    article = Article.find(params[:id])
    render json: { status: article.delete ? 200 : 500 }
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
