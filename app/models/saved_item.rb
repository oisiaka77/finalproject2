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
end
