class PatientMailer < ApplicationMailer
  default from: 'sistema@radiodontica.com.br'

  def welcome_email(patient)
    @patient = patient
    @url  = 'http://www.radiodontica.com.br'
    mail(to: @patient.email, subject: 'Welcome to My Awesome Site')
  end
end
