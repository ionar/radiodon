class RemovePriceFromExams < ActiveRecord::Migration
  def change
    remove_column :exams, :price, :float
  end
end
