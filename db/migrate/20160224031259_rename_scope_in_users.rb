class RenameScopeInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :scope, :provider
  end
end
