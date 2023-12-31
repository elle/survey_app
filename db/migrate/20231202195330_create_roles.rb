class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name, null: false
      t.boolean :billable, null: false, default: false

      t.timestamps
    end
  end
end
