class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :label, null: false
      t.string :hint
      t.references :survey, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
