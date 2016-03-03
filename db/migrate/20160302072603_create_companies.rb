class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_logo
      t.text :company_profile
      t.string :company_name
      t.string :hr_email
      t.string :company_url
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
