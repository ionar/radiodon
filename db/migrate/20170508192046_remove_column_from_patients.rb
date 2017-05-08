class RemoveColumnFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :province_id
  end
end
