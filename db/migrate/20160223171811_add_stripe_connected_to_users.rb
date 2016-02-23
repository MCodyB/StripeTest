class AddStripeConnectedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_connected, :boolean, default: false, null: false
    
    
    add_column :users, :token_type, :string
    add_column :users, :stripe_publishable_key, :string
    add_column :users, :scope, :string
    add_column :users, :livemode, :boolean
    add_column :users, :stripe_user_id, :string
    add_column :users, :refresh_token, :string
    add_column :users, :access_token, :string

    add_column :users, :stripe_returned_hash, :json
  end
end
