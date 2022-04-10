class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.integer :chat_room_id, null: false
      t.text :message
      t.boolean :sender, null: false, default: "false"
      t.timestamps
    end
  end
end
