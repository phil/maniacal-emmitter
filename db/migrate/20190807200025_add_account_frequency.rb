class AddAccountFrequency < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :post_frequency, :integer
  end
end
