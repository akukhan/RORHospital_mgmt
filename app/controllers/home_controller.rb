class HomeController < ApplicationController
    skip_before_action :authenticate_user!, only:[:index]

    def index
        redirect_to after_sign_in_path_for(current_user) if user_signed_in?
    end
end