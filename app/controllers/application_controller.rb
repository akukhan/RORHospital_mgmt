class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    # Handle different user types
    if resource.is_a?(User)
      if resource.respond_to?(:doctor?) && resource.doctor?
        doctor_dashboard_path
      else
        patients_path
      end
    elsif resource.is_a?(PatientUser)
      # Redirect patient users to their dashboard
      patient_portal_dashboard_path
    else
      # Default path
      root_path
    end
  end
  
  private
  
  # Helper method to identify if we're in a patient portal controller
  def patient_portal_controller?
    controller_path.start_with?('patient_portal/') || 
    devise_controller? && resource_name == :patient_user
  end

end
