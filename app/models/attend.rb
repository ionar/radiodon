class Attend < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :patient
  belongs_to :requester
  has_and_belongs_to_many :exam

  validates :requester_id, :clinic_id, :appointment, :schedule, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "sem-imagem.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  default_scope { order(appointment: :asc) }

  scope :para_o_dia, -> (dia) { where schedule: dia }
  scope :para_a_clinica, -> (clinica) { where clinic_id: clinica }

  #scope :four_last, -> { order("products.updated_at DESC LIMIT 4") }

  # simple_calendar find column "start_time". Here set a nickname
  def start_time
        self.schedule
  end

    #scope :clinic, -> (clinic_id) { where clinic_id: clinic_id }
end
