class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.boolean :primary_address, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
