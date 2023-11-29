class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false

      t.timestamps
    end
  end
end
