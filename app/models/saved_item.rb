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
end
