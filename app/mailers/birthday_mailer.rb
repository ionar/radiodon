class BirthdayMailer < ApplicationMailer
  #default from: 'sistema@radiodontica.com.br'

  def greetings_email(patient)
    @patient = patient
    @url  = 'http://www.radiodontica.com.br'
    #arruma o endereço de email se tiver acentos e envia
    mail(to: @patient.email.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s, subject: 'Feliz Aniversario')
  end
end

#Entregar via console
#@patient = Patient.find(10787)
#BirthdayMailer.greetings_email(@patient).deliver_now
