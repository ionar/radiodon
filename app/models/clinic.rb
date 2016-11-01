class Clinic < ActiveRecord::Base
  belongs_to :province
  validates :fantasy_name, uniqueness: true
  validates :fantasy_name, :corporate_name, :cnpj, :phone, :technical_manager, :address, :cep, :city, :province_id, presence: true
end
