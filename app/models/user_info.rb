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
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
