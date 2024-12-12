class AddAdminUserToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :admin_user, null: false, foreign_key: true
  end
end
