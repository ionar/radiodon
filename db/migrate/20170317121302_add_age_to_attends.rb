class AddAgeToAttends < ActiveRecord::Migration
  def change
    add_column :attends, :age, :string
  end
end
