class PostCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :post
end
