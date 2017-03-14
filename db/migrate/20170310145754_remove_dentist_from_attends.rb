class RemoveDentistFromAttends < ActiveRecord::Migration
  def change
    remove_reference :attends, :dentist, index: true, foreign_key: true
  end
end
