class AddAttributesToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :publisher, :string, null: false
    add_column :books, :genre, :string, null: false
  end
end
