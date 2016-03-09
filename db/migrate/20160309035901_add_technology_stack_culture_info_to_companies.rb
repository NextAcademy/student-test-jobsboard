class AddTechnologyStackCultureInfoToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :technology_stack, :string
    add_column :companies, :culture, :text
    add_column :companies, :team_info, :text
  end
end
