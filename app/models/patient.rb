class Patient < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :dentist
  belongs_to :province
  belongs_to :gender

  validates :name, :cpf, :rg, :email, uniqueness: true
  validates :clinic, :dentist, :name, :cpf, :rg, :email, :phone, :address, :cep, :city, :province, presence: true
end
