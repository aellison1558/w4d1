class Modifyusers < ActiveRecord::Migration
  def change
    remove_columns(:users, :name, :email)
    add_column(:users , :username, :string, null: false)
  end
end
