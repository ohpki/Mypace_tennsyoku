class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :sender, null: false
      t.integer :recipient, null: false
      t.string :action, null: false
      t.integer :chat_id, null: false
      t.integer :subscription_id, null: false
      t.integer :scout_id, null: false
      t.boolean :checked, null: false, default: "false"

      t.timestamps
    end
  end
end
