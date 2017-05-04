class Patient < ActiveRecord::Base
  belongs_to :province
  has_many :attends, :dependent => :delete_all

  #validates :name, :cpf, :rg, :email, uniqueness: true
  validates :name, :phone, presence: true

end
