class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :fantasy_name
      t.string :corporate_name
      t.string :cnpj
      t.string :technical_manager
      t.string :address
      t.string :cep
      t.string :city
      t.references :province, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
