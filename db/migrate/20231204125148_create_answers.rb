class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers, id: :uuid do |t|
      t.references :person, null: false, foreign_key: true, type: :uuid
      t.references :question, null: false, foreign_key: true, type: :uuid
      t.text :body, null: false

      t.timestamps
    end
  end
end
