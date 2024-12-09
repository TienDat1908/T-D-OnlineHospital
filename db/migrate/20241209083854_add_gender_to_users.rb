class AddGenderToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :gender, :integer
  end
end
