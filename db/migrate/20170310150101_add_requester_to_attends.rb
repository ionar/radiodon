class AddRequesterToAttends < ActiveRecord::Migration
  def change
    add_reference :attends, :requester, index: true, foreign_key: true
  end
end
