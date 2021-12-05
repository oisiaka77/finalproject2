# == Schema Information
#
# Table name: friendships
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :integer
#  sender_id   :integer
#
class Friendship < ApplicationRecord


  belongs_to(:sender, { :required => true, :class_name => "UserInfo", :foreign_key => "sender_id" })

  belongs_to(:receiver, { :required => true, :class_name => "UserInfo", :foreign_key => "receiver_id" })

  validates(:sender_id, { :presence => true })

  validates(:sender_id, { :uniqueness => true })


end
