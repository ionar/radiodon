class AddProvinceToPatient < ActiveRecord::Migration
  def change
    add_reference :patients, :province, index: true, foreign_key: true
  end
end
