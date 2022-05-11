class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :image_id
      t.string :name

      t.timestamps
    end
  end
end
