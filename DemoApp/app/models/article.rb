class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates :body, :presence => true
  validates :title, :presence => true,
                :length => { :minimum => 5 }
end