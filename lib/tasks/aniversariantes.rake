namespace :aniversariantes do
	desc "send email for patients birthdays"
	task envia: :environment do
		aniversariantes = Patient.aniversariantes
		counter = 0
		aniversariantes.each do |patient|
			if patient.email.present?
				puts patient.name + ' ' + patient.email
				BirthdayMailer.greetings_email(patient).deliver_now
				counter += 1
				sleep 1 #intervalo de 2 segundos entre os emails
			end
		end
		puts "#{counter} emails enviados"
	end
end
# Comando:
# bundle exec rake aniversariantes:envia RAILS_ENV=production

# Para integrar com shell script:
# BUNDLE_GEMFILE=/IONAR/radiodon/Gemfile bundle exec rake -f /IONAR/radiodon/Rakefile aniversariantes:envia RAILS_ENV=production >> /var/log/LOG.ANIVER

#@patient = Patient.find(10787)
#BirthdayMailer.greetings_email(@patient).deliver_now
