class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.timestamps

      t.references :item
      t.datetime :published_at
      t.string :platform_post_id
      t.text :text
    end
  end
end
