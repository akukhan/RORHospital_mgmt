json.extract! patient, :id, :first_name, :last_name, :email, :phone, :date_of_birth, :address, :medical_history, :created_at, :updated_at
json.url patient_url(patient, format: :json)
