class AddRateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime
    add_column :posts, :rate, :string
    add_column :posts, :status, :integer, default: 0, null: false
    add_index :posts, :status
  end
end
