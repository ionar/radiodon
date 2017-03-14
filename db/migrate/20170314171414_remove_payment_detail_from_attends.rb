class RemovePaymentDetailFromAttends < ActiveRecord::Migration
  def change
    remove_column :attends, :payment_detail, :string
  end
end
