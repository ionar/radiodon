class AddProvinceToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :province, :string
  end
end
