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
end
