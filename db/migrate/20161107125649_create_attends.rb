class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.references :clinic, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true
      t.datetime :schedule
      t.references :exam, index: true, foreign_key: true
      t.references :dentist, index: true, foreign_key: true
      t.text :notes
      t.float :discount
      t.float :total
      t.string :payment_detail
      t.boolean :finalized
      t.boolean :missed

      t.timestamps null: false
    end
  end
end
