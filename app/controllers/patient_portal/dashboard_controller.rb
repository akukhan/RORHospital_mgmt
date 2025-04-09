# app/controllers/patient_portal/dashboard_controller.rb
class PatientPortal::DashboardController < PatientPortal::BaseController
  before_action :authenticate_patient_user!
    def index
      @patient = current_patient_user.patient
      @upcoming_appointments = @patient.appointments.where('appointment_date >= ?', Date.today).order(appointment_date: :asc)
    end
  end