require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
  subject { FactoryGirl.create(:article) }

  describe 'Get #index' do
    it 'responds successfully with an HTTP 200 status code' do
      subject
      get :index
      response_body = JSON.parse(response.body)
      expect(response_body['status']).to eq 200
      expect(response_body['articles'].count).to eq 1
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'Post #create' do
    it 'create article successfully' do
      post :create, article: { title: 'first article', body: 'the body of article' }
      response_body = JSON.parse(response.body)
      expect(response_body['status']).to eq 200
      expect(Article.count).to eq 1
      expect(response_body['article']['title']).to eq 'first article'
      expect(response_body['article']['body']).to eq 'the body of article'
    end
  end

  describe 'Put #update' do
    it 'update article successfully' do
      post :update, id: subject.id, article: { title: 'edit first article', body: 'edit the body of article' }
      response_body = JSON.parse(response.body)
      expect(response_body['status']).to eq 200
      expect(Article.count).to eq 1
      expect(response_body['article']['title']).to eq 'edit first article'
      expect(response_body['article']['body']).to eq 'edit the body of article'
    end
  end

  describe 'Delete #destroy' do
    it 'delete article successfully' do
      delete :destroy, id: subject.id
      expect(JSON.parse(response.body)['status']).to eq 200
      expect(Article.count).to eq 0
    end
  end
end
