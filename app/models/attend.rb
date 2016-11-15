class Attend < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :patient
  belongs_to :dentist
  has_and_belongs_to_many :exam

  validates :schedule, uniqueness: true
  validates :clinic_id, :patient_id, :dentist_id, :schedule, presence: true

  # simple_calendar find column "start_time". Here set a nickname
  def start_time
        self.schedule
  end

    scope :clinic, -> (clinic_id) { where clinic_id: clinic_id }
end
