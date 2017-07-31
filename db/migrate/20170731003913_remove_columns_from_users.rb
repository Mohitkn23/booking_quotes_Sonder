class RemoveColumnsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :checkin, :date 
    remove_column :users, :checkout, :date
  end
end
