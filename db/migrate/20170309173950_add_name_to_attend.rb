class AddNameToAttend < ActiveRecord::Migration
  def change
    add_column :attends, :name, :string
  end
end
