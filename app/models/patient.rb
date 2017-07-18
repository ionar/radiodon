class Patient < ActiveRecord::Base
  has_many :attends, :dependent => :delete_all

  #validates :name, :cpf, :rg, :email, uniqueness: true
  validates :name, :phone, presence: true

  #scope :para_o_dia, -> (dia) { where birth_date: dia }

  #scope :aniversariantes, -> {where(birth_date: Date.current.strftime("%d/%m") )}

  diames = Date.current.strftime("%m-%d")

  scope :aniversariantes, ->  {where("birth_date LIKE '%#{diames}%'").order(:name)}

  #scope :red, -> { where(color: 'red') }
  #Patient.where("birth_date LIKE '%Date.current.strftime("%d/%m")%'")

end
