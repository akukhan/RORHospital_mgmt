# app/controllers/patient_portal/appointments_controller.rb
class PatientPortal::AppointmentsController < PatientPortal::ApplicationController
    before_action :set_doctors, only: [:new, :create]
    
    def index
      @patient = current_patient_user.patient
      @appointments = @patient.appointments.order(appointment_date: :desc)
    end
    
    def new
      @appointment = Appointment.new
      @doctors = User.where(role: :doctor)
    end
    
    def create
      @appointment = Appointment.new(appointment_params)
      @appointment.patient = current_patient_user.patient
      @appointment.status = 'scheduled' # Default status
      
      if @appointment.save
        redirect_to patient_portal_appointments_path, notice: "Appointment requested successfully!"
      else
        render :new
      end
    end
    
    def show
      @appointment = current_patient_user.patient.appointments.find(params[:id])
    end
    
    private
    
    def appointment_params
      params.require(:appointment).permit(:user_id, :appointment_date, :reason)
    end
    
    def set_doctors
      @doctors = User.where(role: :doctor)
    end
  end