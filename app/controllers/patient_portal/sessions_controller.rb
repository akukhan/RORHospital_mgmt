# app/controllers/patient_portal/sessions_controller.rb
class PatientPortal::SessionsController < Devise::SessionsController
  # Skip user authentication for patient portal
  skip_before_action :authenticate_user!, if: -> { true }
  
  layout 'patient_portal'

  # def create
  #   @patient_user = PatientUser.find_by(email: params[:patient_user][:email])
  #   if @patient_user && @patient_user.valid_password?(params[:patient_user][:password])
  #     sign_in(:patient_user, @patient_user)   # This sets up Devise’s warden session
  #     redirect_to patient_portal_appointments_path, notice: "Signed in successfully."
  #   else
  #     flash.now[:alert] = "Invalid credentials."
  #     render :new
  #   end
  # end
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    redirect_to patient_portal_appointments_path, notice: "Signed in successfully."
  end

  def after_sign_in_path_for(resource)
    patient_portal_dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_patient_user_session_path
  end
  
  # # Override the after sign in path
  # def after_sign_in_path_for(resource)
  #   patient_portal_dashboard_path
  # end
  
  # # Override the after sign out path
  # def after_sign_out_path_for(resource_or_scope)
  #   patient_portal_login_path
  # end
end