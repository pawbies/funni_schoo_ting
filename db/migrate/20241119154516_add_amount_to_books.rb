class AddAmountToBooks < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :amount, :integer, null: false, default: 1
  end
end
