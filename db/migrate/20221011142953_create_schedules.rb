class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      
      t.integer :admin_id, null: false
      t.integer :inquiry_id, null: false
      t.datetime :start_time, null: false
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
