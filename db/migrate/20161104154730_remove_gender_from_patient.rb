class RemoveGenderFromPatient < ActiveRecord::Migration
  def change
    remove_column :patients, :gender, :string
  end
end
