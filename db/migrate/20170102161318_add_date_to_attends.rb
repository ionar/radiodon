class AddDateToAttends < ActiveRecord::Migration
  def change
    add_column :attends, :date, :date
  end
end
