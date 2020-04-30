class AddUserRefToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :user, foreign_key: true, after: :released_at, null: false
  end
end
