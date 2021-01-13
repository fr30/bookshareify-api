class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :password_hash, null: false
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.boolean :admin, default: false
      t.timestamps
    end

    add_index :users, :login, unique: true
  end
end
