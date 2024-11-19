class CreateCategoriesBooksJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :categories, :books do |t|
      # t.index [:category_id, :book_id]
      # t.index [:book_id, :category_id]
    end
  end
end
