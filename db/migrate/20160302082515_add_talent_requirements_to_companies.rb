class AddTalentRequirementsToCompanies < ActiveRecord::Migration
  def change
  	enable_extension "hstore"
  	add_column :companies, :talent_requirements, :hstore, array: true
  end
end
