class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.text :description
      t.string :isbn
      t.float :price
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
