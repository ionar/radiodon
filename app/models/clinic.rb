class Clinic < ActiveRecord::Base
  belongs_to :province
  has_many :patients
  validates :fantasy_name, uniqueness: true
  validates :fantasy_name, :corporate_name, :cnpj, :phone, :technical_manager, :address, :cep, :city, :province_id, presence: true

end
