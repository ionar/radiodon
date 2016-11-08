class Attend < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :patient
  belongs_to :dentist
  has_and_belongs_to_many :exam

  validates :schedule, uniqueness: true
  validates :clinic_id, :patient_id, :schedule, :payment_detail, presence: true

end
