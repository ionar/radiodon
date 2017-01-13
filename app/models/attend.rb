class Attend < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :patient
  belongs_to :dentist
  has_and_belongs_to_many :exam

  validates :appointment, uniqueness: true
  validates :clinic_id, :patient_id, :dentist_id, :schedule, presence: true

  scope :para_o_dia, -> (dia) { where schedule: dia }
  scope :para_a_clinica, -> (clinica) { where clinic_id: clinica }

  # simple_calendar find column "start_time". Here set a nickname
  def start_time
        self.schedule
  end

    #scope :clinic, -> (clinic_id) { where clinic_id: clinic_id }
end
