class CreateDentists < ActiveRecord::Migration
  def change
    create_table :dentists do |t|
      t.string :name
      t.string :register
      t.string :email
      t.string :phone
      t.text :notes

      t.timestamps null: false
    end
  end
end
