class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :description
      t.string :price
      t.integer :store_id
      t.string :item_url
      t.integer :clothing_category_id

      t.timestamps
    end
  end
end
