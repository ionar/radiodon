json.extract! dentist, :id, :name, :register, :email, :phone, :notes, :created_at, :updated_at
json.url dentist_url(dentist, format: :json)