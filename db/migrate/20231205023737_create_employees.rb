class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees, id: :uuid do |t|
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :person, null: false, foreign_key: true, type: :uuid
      t.boolean :admin

      t.timestamps
    end
  end
end
