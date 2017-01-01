class AddFilialToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :filial, :string
  end
end
