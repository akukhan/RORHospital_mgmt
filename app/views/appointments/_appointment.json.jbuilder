json.extract! appointment, :id, :patient_id, :user_id, :appointment_date, :reason, :status, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
