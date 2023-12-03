class AddPersonToSurvey < ActiveRecord::Migration[7.1]
  def change
    add_reference :surveys, :person, null: false, foreign_key: true, type: :uuid
  end
end
