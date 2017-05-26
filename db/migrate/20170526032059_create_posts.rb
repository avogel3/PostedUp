class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.datetime :posted_date
      t.boolean :published

      t.timestamps
    end
  end
end
