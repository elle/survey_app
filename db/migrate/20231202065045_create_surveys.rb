class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys, id: :uuid do |t|
      t.string :name, null: false
      t.string :description
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
