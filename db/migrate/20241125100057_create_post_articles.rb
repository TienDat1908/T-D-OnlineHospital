class CreatePostArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :post_articles do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
