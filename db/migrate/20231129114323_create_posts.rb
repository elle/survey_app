class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title, null: false
      t.string :description
      t.text :body
      t.integer :status, default: 0
      t.references :person, null: false, foreign_key: true, type: :uuid
      t.datetime :published_on

      t.timestamps
    end
  end
end
