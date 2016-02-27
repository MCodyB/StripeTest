class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.integer :user_id
    end
    add_index :things, :user_id
  end
end
