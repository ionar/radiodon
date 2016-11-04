class AddCityToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :city, :string
  end
end
