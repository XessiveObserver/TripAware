class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    

    def after_sign_in_path_for(users)
        trips_path
    end
    def after_sign_out_path_for(users)
        root_path
    end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :password, :current_password)}
        end
end
