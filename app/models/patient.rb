class Patient < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :dentist
  belongs_to :province
  belongs_to :gender
  has_many :attends

  validates :name, :cpf, :rg, :email, uniqueness: true
  validates :clinic, :name, :phone, presence: true
end
