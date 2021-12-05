# == Schema Information
#
# Table name: items
#
#  id                   :integer          not null, primary key
#  description          :string
#  item_url             :string
#  price                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  clothing_category_id :integer
#  store_id             :integer
#
class Item < ApplicationRecord

  has_many(:saved_items, { :class_name => "SavedItem", :foreign_key => "item_id", :dependent => :destroy })

  #belongs_to(:store, { :required => true, :class_name => "Store", :foreign_key => "store_id" })

  belongs_to(:clothing_category, { :required => true, :class_name => "ClothingCategory", :foreign_key => "clothing_category_id" })

  #Attribution Accessors
 
  #Collects store id and returns store name

    def store_name
      store_id= self.store_id

      matching_stores= Store.where({:id => store_id})
      
      the_store = matching_stores.at(0)
       
        return the_store.name
        
    end

    #Collects category id and returns category name
    def category
      store_id= self.clothing_category_id

      matching_categories= ClothingCategory.where({:id => clothing_category_id})
      
      the_category = matching_categories.at(0)
       
        return the_category.category_name
        
    end
end
