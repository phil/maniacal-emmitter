class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|

      t.timestamps

      t.string :name
      t.string :token
    end
  end
end
