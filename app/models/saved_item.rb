# == Schema Information
#
# Table name: saved_items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  user_id    :integer
#
class SavedItem < ApplicationRecord




  belongs_to(:user, { :required => true, :class_name => "UserInfo", :foreign_key => "user_id" })

  belongs_to(:item, { :required => true, :class_name => "Item", :foreign_key => "item_id" })

  #Takes Item ID from Saved item table and give you back  item description
  def saved_item_description
  the_item_id = self.item_id
  matching_item = Item.where({:id => the_item_id})
    return matching_item.at(0).description
  end
end
