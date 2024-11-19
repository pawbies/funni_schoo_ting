class CreateBorrows < ActiveRecord::Migration[7.2]
  def change
    create_table :borrows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :borrow_date, null: false
      t.date :return_date, null: false
      t.boolean :returned, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false

      t.timestamps
    end
  end
end
