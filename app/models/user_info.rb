# == Schema Information
#
# Table name: user_infos
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  phone_number    :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class UserInfo < ApplicationRecord

  has_many(:sent_friendships, { :class_name => "Friendship", :foreign_key => "sender_id", :dependent => :destroy })

  has_many(:received_friendships, { :class_name => "Friendship", :foreign_key => "receiver_id", :dependent => :destroy })

  has_many(:saved_items, { :class_name => "SavedItem", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:items, { :through => :saved_items, :source => :item })

  has_many(:stores, { :through => :items, :source => :the_store })

  validates(:username, { :presence => true })
  validates(:username, { :uniqueness => true })

  validates(:phone_number, { :length => { :minimum => 10, :maximum => 10 } })
  validates(:phone_number, { :presence => true })



  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password



  #Getting each users shopping portfolio by matching with a user id

  def user_items
    user_id = self.id
    list_of_saved_items = SavedItem.where({:user_id => user_id})
    matching_saved_item = list_of_saved_items.at(0) 
    the_item_id = matching_saved_item.item_id 
    item_info = Item.where({:id => the_item_id}) 
    list_of_user_items = item_info.at(0)


    return list_of_user_items.description

  end
end
