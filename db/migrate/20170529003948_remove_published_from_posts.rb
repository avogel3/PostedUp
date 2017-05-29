class RemovePublishedFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :published, :boolean
  end
end
