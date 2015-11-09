class AddPasswordToUserSession < ActiveRecord::Migration
  def change
    add_column :user_sessions, :password, :string
    add_column :user_sessions, :username, :string
  end
end
