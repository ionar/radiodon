class RemoveIndexFromPatients < ActiveRecord::Migration
  def change
    remove_index :patients, :province_id
  end
end
