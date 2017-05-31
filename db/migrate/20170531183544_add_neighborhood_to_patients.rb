class AddNeighborhoodToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :heighborhood, :string
  end
end
