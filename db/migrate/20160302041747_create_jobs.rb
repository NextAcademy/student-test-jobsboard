class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :job_description
      t.string :location
      t.string :job_poster_email
      t.string :company_name

      t.timestamps null: false
    end
  end
end
