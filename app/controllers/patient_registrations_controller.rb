# # app/controllers/patient_registrations_controller.rb
# class PatientRegistrationsController < ApplicationController
#     before_action :authenticate_user!
#     before_action :ensure_receptionist
#     before_action :set_patient, only: [:create_account]
    
#     def new_account
#       @patient = Patient.find(params[:patient_id])
#       if @patient.patient_user.present?
#         redirect_to @patient, alert: 'This patient already has a portal account.'
#       end
#     end
    
#     def create_account
#       @patient_user = PatientUser.new(patient_user_params)
#       @patient_user.patient = @patient
      
#       if @patient_user.save
#         # Send welcome email with login details (in a real app, use a secure method)
#         redirect_to @patient, notice: 'Patient portal account created successfully.'
#       else
#         render :new_account
#       end
#     end
    
#     private
    
#     def set_patient
#       @patient = Patient.find(params[:patient_id])
#     end
    
#     def patient_user_params
#       params.require(:patient_user).permit(:email, :password, :password_confirmation)
#     end
    
#     def ensure_receptionist
#       unless current_user.receptionist?
#         flash[:alert] = "Only receptionists can perform this action."
#         redirect_to root_path
#       end
#     end
#   end