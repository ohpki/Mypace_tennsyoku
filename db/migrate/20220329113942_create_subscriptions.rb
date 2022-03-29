class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.integer :job_information_id, null: false
      t.integer :nurse_id, null: false

      t.timestamps
    end
  end
end
