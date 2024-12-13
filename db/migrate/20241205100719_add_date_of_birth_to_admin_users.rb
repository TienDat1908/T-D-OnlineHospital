class AddDateOfBirthToAdminUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :admin_users, :date_of_birth, :date
  end
end
