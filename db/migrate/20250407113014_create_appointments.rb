class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :appointment_date
      t.text :reason
      t.integer :status

      t.timestamps
    end
  end
end
