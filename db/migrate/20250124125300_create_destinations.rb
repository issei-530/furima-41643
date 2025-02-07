class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :post_code, null: false
      t.integer :region_id, null: false
      t.string :city, null: false
      t.string :street_address, null: false
      t.string :building_name
      t.string :telephone, null: false
      t.references :buy, null:false, foreign_key: true
      t.timestamps
    end
  end
end
