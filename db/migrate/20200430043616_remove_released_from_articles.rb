class RemoveReleasedFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :released_at, :datetime
  end
end
