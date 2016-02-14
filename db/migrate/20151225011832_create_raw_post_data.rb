class CreateRawPostData < ActiveRecord::Migration
  def change
    create_table :raw_post_data do |t|
      t.integer :source
      t.string :identifier
      t.string :term
      t.string :location
      t.text :data
      t.timestamps
    end

    add_index :raw_post_data, [:source, :identifier], unique: true
  end
end
