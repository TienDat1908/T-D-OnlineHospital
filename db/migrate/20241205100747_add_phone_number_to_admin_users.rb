class AddPhoneNumberToAdminUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :admin_users, :phone_number, :string
  end
end
