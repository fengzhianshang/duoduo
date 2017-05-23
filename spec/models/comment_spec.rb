require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { FactoryGirl.create(:comment) }

  describe '#create' do
    it '成功创建comment' do
      subject
      expect(Article.count).to eq 1
      expect(Comment.count).to eq 1
      expect(Comment.first.content).to eq '你确实帅的不行了'
      expect(Comment.first.article_id).to eq Article.first.id
    end
  end
end
