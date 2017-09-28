class RenamePostedDateForPost < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :posted_date, :posted_at
  end
end
