class RemoveTypeFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :type
  end
end
