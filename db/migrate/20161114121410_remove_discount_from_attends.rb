class RemoveDiscountFromAttends < ActiveRecord::Migration
  def change
    remove_column :attends, :discount, :float
  end
end
