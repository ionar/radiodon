class AddDescriptiveToAttends < ActiveRecord::Migration
  def change
    add_column :attends, :descriptive, :string
  end
end
