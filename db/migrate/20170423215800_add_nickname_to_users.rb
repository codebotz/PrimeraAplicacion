class AddNicknameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nombres, :string, null: false
    add_column :users, :apellidos, :string, null: false
    add_column :users, :nickname, :string, null: false
    add_index :users, :nickname, unique: true

  end
end
