# app/controllers/patient_portal/registrations_controller.rb
class PatientPortal::RegistrationsController < Devise::RegistrationsController
  layout 'patient_portal'
  
  def new
    build_resource({})
    @patient = Patient.new
    respond_with resource
  end
  
  def create
    # Use patient_user_params instead of sign_up_params
    build_resource(patient_user_params)
    
    # Create the patient with the patient attributes
    @patient = Patient.new(patient_params)
    
    ActiveRecord::Base.transaction do
      if @patient.save
        # Associate patient with patient_user
        resource.patient = @patient
        
        if resource.save
          if resource.active_for_authentication?
            set_flash_message! :notice, :signed_up
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
          end
        else
          @patient.destroy # Clean up if patient_user save fails
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end

  protected

  def after_sign_up_path_for(resource)
    patient_portal_dashboard_path
  end
  
  # Use these instead of sign_up_params to handle the nested format
  def patient_user_params
    params.require(:patient_user).permit(:email, :password, :password_confirmation)
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :phone, :date_of_birth, :address)
  end
  
  # Override Devise's configure_sign_up_params
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
end