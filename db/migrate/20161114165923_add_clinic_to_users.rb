class AddClinicToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :clinic, index: true, foreign_key: true
  end
end
