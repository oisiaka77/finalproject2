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

  validates(:username, { :presence => true })
  validates(:username, { :uniqueness => true })

  validates(:phone_number, { :length => { :minimum => 10, :maximum => 10 } })
  validates(:phone_number, { :presence => true })



  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
