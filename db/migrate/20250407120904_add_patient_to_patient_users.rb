class AddPatientToPatientUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :patient_users, :patient, null: false, foreign_key: true
  end
end
