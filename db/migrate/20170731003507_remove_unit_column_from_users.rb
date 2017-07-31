class RemoveUnitColumnFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :unit_id, :integer
  end
end
