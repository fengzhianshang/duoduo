class CommentsController < ApplicationController
  before_action :article

  def index
    render json: { status: 200, comments: @article.comments }.to_json
  end

  def create
    comment = @article.comments.create(comment_params)
    render json: { status: 200, comment: comment }.to_json
  end

  def update
    comment = @article.comments.find(params[:id])
    comment.content = comment_params[:content]
    comment.save!
    render json: { status: 200, comment: comment }.to_json
  end

  def destroy
    comment = @article.comments.find(params[:id])
    render json: { status: comment.delete ? 200 : 500 }.to_json
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def article
    @article = Article.find(params[:article_id])
  end
end
