class AddPhone2ToRequesters < ActiveRecord::Migration
  def change
    add_column :requesters, :phone2, :string
  end
end
