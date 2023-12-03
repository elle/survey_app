class AddSlugToSurvey < ActiveRecord::Migration[7.1]
  def change
    add_column :surveys, :slug, :string
    add_index :surveys, [:company_id, :slug], unique: true
  end
end
