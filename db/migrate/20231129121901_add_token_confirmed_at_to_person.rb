class AddTokenConfirmedAtToPerson < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :token, :string
    add_column :people, :confirmed_at, :datetime
  end
end
