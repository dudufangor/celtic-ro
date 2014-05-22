class User < ActiveRecord::Base
	self.table_name = 'login'

	# attr_accessor :userid, :userpass, :userpass, :email, :sex
end