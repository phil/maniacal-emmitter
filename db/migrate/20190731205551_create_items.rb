class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps

      t.references :account
      t.boolean :active, default: true
      t.text :text
      t.datetime :latest_published_at
    end
  end
end
