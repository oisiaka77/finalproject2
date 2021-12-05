class CreateClothingCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_categories do |t|
      t.string :category_name

      t.timestamps
    end
  end
end
