class RemoveForeignkeyFromPatients < ActiveRecord::Migration
  def change
    #remove_reference :patients, :province, index: true, foreign_key: true
    remove_foreign_key :patients, :provinces
  end
end
