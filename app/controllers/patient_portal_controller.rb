# # app/controllers/patient_portal_controller.rb
# class PatientPortalController < ApplicationController
#     before_action :authenticate_patient_user!
#     layout 'patient_portal'
    
#     def dashboard
#       @patient = current_patient_user.patient
#       @upcoming_appointments = @patient.appointments.where('appointment_date >= ? AND status = ?',Date.today,Appointment.statuses[:scheduled]).order(appointment_date: :asc)
#     end
    
#     def medical_history
#       @patient = current_patient_user.patient
#       @medical_records = @patient.medical_records.order(created_at: :desc)
#     end
    
#     def appointments
#       @patient = current_patient_user.patient
#       @appointments = @patient.appointments.order(appointment_date: :desc)
#     end
    
#     def request_appointment
#       @patient = current_patient_user.patient
#       @doctors = User.where(role: :doctor)
#       @appointment = @patient.appointments.build
#     end
    
#     def create_appointment_request
#       @patient = current_patient_user.patient
#       @appointment = @patient.appointments.build(appointment_params)
      
#       if @appointment.save
#         redirect_to patient_portal_appointments_path, notice: 'Appointment request submitted successfully.'
#       else
#         @doctors = User.where(role: :doctor)
#         render :request_appointment
#       end
#     end
    
#     private
    
#     def appointment_params
#       params.require(:appointment).permit(:user_id, :appointment_date, :reason)
#         .merge(status: :scheduled)
#     end
#   end