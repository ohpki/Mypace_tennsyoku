class CreateJobInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :job_informations do |t|
      t.integer :hospital_id, null: false
      t.string :title, null: false
      t.string :work_style, null: false
      t.string :alarys, null: false
      t.string :hospital_name, null: false
      t.string :address, null: false
      t.boolean :job_offer_status, null: false, default: "true"
      t.text :job_detail

      t.timestamps
    end
  end
end
