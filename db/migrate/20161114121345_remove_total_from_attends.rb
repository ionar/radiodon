class RemoveTotalFromAttends < ActiveRecord::Migration
  def change
    remove_column :attends, :total, :float
  end
end
