class User < ActiveRecord::Base
	self.table_name = 'login'

	alias_attribute :username, :userid
	alias_attribute :password, :user_pass
	
	validates :email, confirmation: true
	validates :email_confirmation, presence: true
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :username, :email, uniqueness: true
	validates :username, :email, :password, :sex, presence: true
	validates :sex, inclusion: %w(M F)
end