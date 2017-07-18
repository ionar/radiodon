class BirthdayMailer < ApplicationMailer
  default from: 'sistema@radiodontica.com.br'

  def greetings_email(patient)
    @patient = patient
    @url  = 'http://www.radiodontica.com.br'
    mail(to: @patient.email, subject: 'Feliz Aniversário')
  end
end

#Entregar via console
#@patient = Patient.find(47770)
#BirthdayMailer.greetings_email(@patient).deliver
