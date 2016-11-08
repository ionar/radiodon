class AddAttendsAndExams < ActiveRecord::Migration
  def change
  	create_table :attends_exams, :id => false do |t|
      t.references :attend, :exam
    end
  end
end
