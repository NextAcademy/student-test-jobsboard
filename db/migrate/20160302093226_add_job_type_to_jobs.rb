class AddJobTypeToJobs < ActiveRecord::Migration
  def change
  	enable_extension "hstore"
  	add_column :jobs, :employment_terms, :hstore, array: true
  end
end
