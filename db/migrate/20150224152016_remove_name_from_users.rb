class RemoveNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name, type = :string
  end
end
