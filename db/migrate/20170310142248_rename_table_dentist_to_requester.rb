class RenameTableDentistToRequester < ActiveRecord::Migration
  def change
  	 rename_table :dentists, :requesters
  end
end
