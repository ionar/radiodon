class ChangeScheduleTypeInAttends < ActiveRecord::Migration
  def change
  	change_column :attends, :schedule, :date
  end
end
