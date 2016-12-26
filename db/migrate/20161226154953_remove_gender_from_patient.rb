class RemoveGenderFromPatient < ActiveRecord::Migration
  def change
    remove_reference :patients, :gender, index: true, foreign_key: true
  end
end
