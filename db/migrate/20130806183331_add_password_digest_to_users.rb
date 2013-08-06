class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :username, :string, :limit=>25
    remove_column :users, :password
  end
end
