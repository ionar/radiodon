class ChangeColumnNameInAttends < ActiveRecord::Migration
  def change
  	rename_column :attends, :date, :appointment
  	change_column :attends, :appointment, :time
  end
end
