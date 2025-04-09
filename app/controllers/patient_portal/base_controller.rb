# app/controllers/patient_portal/base_controller.rb
class PatientPortal::BaseController < ApplicationController
    # Skip user authentication for patient portal
    skip_before_action :authenticate_user!, if: -> { true }
    
    # Add patient user authentication for patient portal
    before_action :authenticate_patient_user!
    
    layout 'patient_portal'
    
    protected
    
    def authenticate_patient_user!
      unless patient_user_signed_in?
        store_location_for(:patient_user, request.fullpath)
        redirect_to patient_portal_login_path
      end
    end
  end