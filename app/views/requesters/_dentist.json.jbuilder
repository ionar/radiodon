json.extract! requester, :id, :name, :register, :email, :phone, :notes, :created_at, :updated_at
json.url requester_url(requester, format: :json)