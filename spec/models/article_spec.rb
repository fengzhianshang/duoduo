require 'rails_helper'
RSpec.describe Article, type: :model do
  subject { FactoryGirl.create(:article) }

  describe '#create' do
    it '成功创建article' do
      expect(subject.title).to eq '我帅'
      expect(subject.body).to eq '我的帅需要解释吗？'
      expect(Article.count).to eq 1
    end
  end
end
