class Article < ActiveRecord::Base
  has_many :comments
  validates :body, :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
end
