class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :sender, null: false
      t.integer :recipient, null: false
      t.integer :action, null: false
      t.integer :chst_room_id
      t.integer :job_information_id
      t.integer :scout_id
      t.boolean :checked, null: false, default: "false"

      t.timestamps
    end
  end
end
