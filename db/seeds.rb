# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
User.create!(
  email: 'doctor@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  role: 'doctor'
)

User.create!(
  email: 'receptionist@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  role: 'reception'
)

# Create patients
# Start 9 days ago

10.times do |i|
  start_date = Date.today - 9.days
    record_date = start_date + i.days
    patient_count = rand(1..10)

    patient_count.times do |j|

        Patient.create!(
        first_name: "Patient#{j}",
        last_name: "LastName#{j}",
        email: "patient#{j}@example.com",
        phone: "123-456-789#{j}",
        date_of_birth: Date.today - (20 + j).years,
        address: "123 Street #{j}, City",
        medical_history: "Patient #{j} medical history",
        created_at: record_date,
        updated_at: record_date
        )
    end
end