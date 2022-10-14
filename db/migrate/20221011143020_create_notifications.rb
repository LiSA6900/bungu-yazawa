class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      
      t.integer :visiter_id, null: false
      t.integer :visited_id, null: false
      t.integer :inquiry_id, null: false
      t.string :action, null: false
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end