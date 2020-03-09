class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :url
      t.string :job_feed_url

      t.timestamps
    end
  end
end
