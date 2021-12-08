# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  address    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Store < ApplicationRecord




  has_many(:items, { :class_name => "Item", :foreign_key => "store_id", :dependent => :destroy })

  validates(:name, { :presence => { :message => "This field can't be blank" } })
  
end
