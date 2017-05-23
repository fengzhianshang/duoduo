class Article < ActiveRecord::Base
  has_many :commits
end
