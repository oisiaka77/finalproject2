class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :username
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
