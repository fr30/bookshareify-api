class CreateBookshelfBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookshelf_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :bookshelf, null: false, foreign_key: true
      t.timestamps
    end

    add_index :bookshelf_books, [:bookshelf_id, :book_id], unique: true
  end
end
