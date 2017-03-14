class RemoveMissedFromAttends < ActiveRecord::Migration
  def change
    remove_column :attends, :missed, :boolean
  end
end
