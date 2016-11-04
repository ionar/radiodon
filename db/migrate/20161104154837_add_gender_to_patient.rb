class AddGenderToPatient < ActiveRecord::Migration
  def change
    add_reference :patients, :gender, index: true, foreign_key: true
  end
end
