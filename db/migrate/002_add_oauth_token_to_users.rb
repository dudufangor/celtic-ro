class AddOauthTokenToUsers < ActiveRecord::Migration
  def self.change
    add_column :users, :oauth_token, :string
  end
end