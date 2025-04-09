class DoctorController < ApplicationController

    before_action :ensure_doctor
    
    def dashboard
      @patients = Patient.all
      @patients_by_day = Patient.group_by_day(:created_at).count
      
    end
    
    private
    
    def ensure_doctor
      unless current_user.doctor?
        flash[:alert] = "Only doctors can access this page."
        redirect_to root_path
      end
    end
end


