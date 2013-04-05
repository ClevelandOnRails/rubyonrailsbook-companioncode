class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :articles
  include ActiveModel::ForbiddenAttributesProtection

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  ROLES =%w[admin default]
  private
    def setup_default_role_for_new_users
      if self.role.blank?
        self.role = "default"
      end
    end
  #end - here for the code checking sanity.
end