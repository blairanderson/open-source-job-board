class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, default: 1
      t.string :title
      t.string :location
      t.integer :job_type
      t.text :description
      t.string :company_name
      t.string :company_url
      t.string :company_logo
      t.integer :how_to_apply
      t.string :how_to_apply_address
      t.string :contact_email

      t.timestamps
    end
  end
end
