class AddOauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauthToken, :string
    add_column :users, :oauthSecret, :string
  end
end
