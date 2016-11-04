class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.references :clinic, index: true, foreign_key: true
      t.references :dentist, index: true, foreign_key: true
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :gender
      t.date :birth_date
      t.string :email
      t.string :address
      t.string :cep
      t.string :phone
      t.string :phone2
      t.string :occupation
      t.string :mothers_name
      t.string :fathers_name
      t.text :notes

      t.timestamps null: false
    end
  end
end
