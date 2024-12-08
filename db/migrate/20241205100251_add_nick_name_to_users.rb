class AddNickNameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :nick_name, :string
  end
end
