class RemoveClinicFromPatients < ActiveRecord::Migration
  def change
    remove_reference :patients, :clinic, index: true, foreign_key: true
  end
end
