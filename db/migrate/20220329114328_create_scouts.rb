class CreateScouts < ActiveRecord::Migration[6.1]
  def change
    create_table :scouts do |t|
      t.integer :hospital_id, null: false
      t.integer :nurse_id, null: false

      t.timestamps
    end
  end
end
