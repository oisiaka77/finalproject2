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
end
