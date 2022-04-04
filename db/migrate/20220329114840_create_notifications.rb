class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :sender, null: false
      t.integer :recipient, null: false
      t.integer :action, null: false
      t.integer :chat_id
      t.integer :subscription_id
      t.integer :scout_id
      t.boolean :checked, null: false, default: "false"

      t.timestamps
    end
  end
end
