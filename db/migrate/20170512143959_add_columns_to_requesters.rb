class AddColumnsToRequesters < ActiveRecord::Migration
  def change
    add_column :requesters, :address, :string
    add_column :requesters, :complement, :string
    add_column :requesters, :city, :string
    add_column :requesters, :province, :string
  end
end
