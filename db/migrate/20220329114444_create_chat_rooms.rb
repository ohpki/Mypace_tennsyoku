class CreateChatRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_rooms do |t|
      t.integer :hospital_id, null: false
      t.integer :nurse_id, null: false
      t.integer :rejection

      t.timestamps
    end
  end
end
