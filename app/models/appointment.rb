class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :user  

  enum :status, { scheduled: 0, completed: 1, cancelled: 2 }

  validates :appointment_date, :reason, presence: true
  validate :appointment_date_cannot_be_in_the_past, on: :create

  private
  
  def appointment_date_cannot_be_in_the_past
    if appointment_date.present? && appointment_date < Date.today
      errors.add(:appointment_date, "can't be in the past")
    end
  end
end
