class AddDefaultPublishedValueToPosts < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :published, :boolean, :default => false
  end
end
