class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      # user_typeがtrueなら看護師宛ての通知　falseなら病院宛ての通知
      t.boolean :user_type
      t.integer :nurse_id, null: false
      t.integer :hospital_id, null: false
      t.integer :action, null: false
      t.integer :chst_room_id
      t.integer :job_information_id
      t.integer :scout_id
      t.boolean :checked, null: false, default: "false"

      t.timestamps
    end
  end
end
