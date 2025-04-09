class Patient < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_one :patient_user, dependent: :destroy
end
