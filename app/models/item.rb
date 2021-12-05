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
end
