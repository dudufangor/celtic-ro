class SorceryCore < ActiveRecord::Migration
  def change
    add_column :login, :crypted_password, :string
    add_column :login, :salt, :string
  end
end