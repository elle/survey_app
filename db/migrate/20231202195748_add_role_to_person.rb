class AddRoleToPerson < ActiveRecord::Migration[7.1]
  def change
    add_reference :people, :role, null: false, foreign_key: true, type: :uuid
  end
end
