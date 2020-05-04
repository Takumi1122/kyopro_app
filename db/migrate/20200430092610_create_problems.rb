class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :link
      t.text :answer
      t.references :article, foreign_key: true, null: false

      t.timestamps
    end
  end
end
