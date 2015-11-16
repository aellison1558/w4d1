class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :name, :string, null: false)
    add_column(:users, :email, :string, null: false)
  end
end
