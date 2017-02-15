require 'csv'
namespace :import do
	desc "impot pacients from csv file"
	task patients: :environment do
		filename = File.join Rails.root, "clientes-todos.csv"
		counter = 0
		CSV.foreach(filename, headers: true) do |row|
			p row
			patient = Patient.create(filial: row["filial"], name: row["name"], gender: row["gender"], cpf: row["cpf"],
				rg: row["rg"], birth_date: row["birth_date"], email: row["email"], address: row["address"], cep: row["cep"],
				phone: row["phone"], phone2: row["phone2"], occupation: row["occupation"], mothers_name: row["mothers_name"],
			
				fathers_name: row["fathers_name"], notes: row["notes"], city: row["city"], province_id: row["province_id"])


			#filial, name, gender, cpf, rg, birth_date, email, address, cep, phone, phone2, occupation, mothers_name, fathers_name, notes, city, province_id"


			puts "#{patient.errors.full_messages.join(",")}" if patient.errors.any?
			counter += 1 if patient.persisted?
			puts "---#{counter}---"
		end
		puts "#{counter} importados"
	end
end
# Comando:
# bundle exec rake import:patients RAILS_ENV=production