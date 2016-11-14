class RemoveDentistFromPatient < ActiveRecord::Migration
  def change
    remove_reference :patients, :dentist, index: true, foreign_key: true
  end
end
