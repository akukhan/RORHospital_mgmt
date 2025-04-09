# app/controllers/patient_portal/application_controller.rb
class PatientPortal::ApplicationController < ApplicationController
    layout 'patient_portal'
    skip_before_action :authenticate_user!, if: -> { true }, raise: false
    before_action :authenticate_patient_user!
    
    private
    
    def authenticate_patient_user!
      unless patient_user_signed_in?
        flash[:alert] = "You need to sign in to access the patient portal."
        redirect_to new_patient_user_session_path
      end
    end
    
    def patient_user_signed_in?
      current_patient_user.present?
    end
    
    # def current_patient_user
    #   @current_patient_user ||= PatientUser.find_by(id: session[:patient_user_id]) if session[:patient_user_id]
    # end
    helper_method :patient_user_signed_in?
  end