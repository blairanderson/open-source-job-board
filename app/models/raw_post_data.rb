class RawPostData < ActiveRecord::Base
  serialize :data
  enum source: [:stackoverflow]
end
