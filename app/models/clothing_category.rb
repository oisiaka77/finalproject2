# == Schema Information
#
# Table name: clothing_categories
#
#  id            :integer          not null, primary key
#  category_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class ClothingCategory < ApplicationRecord
end
