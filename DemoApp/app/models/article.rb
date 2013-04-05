class Article < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :comments, :dependent => :destroy
  validates :body, :presence => true
  validates :title, :presence => true,
                :length => { :minimum => 5 }
  
  belongs_to :user
end
