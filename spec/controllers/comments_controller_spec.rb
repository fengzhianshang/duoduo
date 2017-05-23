require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    FactoryGirl.create(:comment)
  end

  let(:article) { Article.first }

  describe 'Get #index' do
    it 'get all comments by article' do
      get :index, article_id: article.id
      response_body = JSON.parse(response.body)
      expect(response_body['status']).to eq 200
      expect(response_body['comments'].count).to eq 1
    end
  end

  describe 'Post #create' do
    it 'create comment successfully' do
      post :create, article_id: article.id, comment: { content: '哈哈。。。' }
      response_body = JSON.parse(response.body)
      expect(response_body['status']).to eq 200
      expect(response_body['comment']['content']).to eq '哈哈。。。'
      expect(article.comments.count).to eq 2
    end
  end

  describe 'Put #update' do
    it 'update comment successfully' do
      put :update, article_id: article.id, id: Comment.first.id, comment: { content: '哈哈。。。哈' }
      response_body = JSON.parse(response.body)
      expect(response_body['status']).to eq 200
      expect(response_body['comment']['content']).to eq '哈哈。。。哈'
      expect(article.comments.count).to eq 1
    end
  end

  describe 'Delete #destroy' do
    it 'delete comment successfully' do
      delete :destroy, article_id: article.id, id: Comment.first.id
      response_body = JSON.parse(response.body)
      expect(response_body['status']).to eq 200
      expect(Comment.count).to eq 0
      expect(Article.count).to eq 1
    end
  end
end
