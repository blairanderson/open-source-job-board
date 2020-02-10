class CreatePostCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :post_categories do |t|
      t.references :category, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
