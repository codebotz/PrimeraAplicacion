class AddNicknameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nombres, :string
    add_column :users, :apellidos, :string
    add_column :users, :nickname, :string
    add_index :users, :nickname, unique: true

  end
end
