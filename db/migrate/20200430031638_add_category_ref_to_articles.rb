class AddCategoryRefToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :category, foreign_key: true, after: :user_id, null: false
  end
end
