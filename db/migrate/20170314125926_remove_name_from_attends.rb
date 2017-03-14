class RemoveNameFromAttends < ActiveRecord::Migration
  def change
    remove_column :attends, :name, :string
  end
end
