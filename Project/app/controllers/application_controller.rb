class ApplicationController < ActionController::Base


    protect_from_forgery with: :exception

    def set_current_user
        @current_user |= User.where(:id => session[:id])
    end



    def after_sign_up_path_for(resource)
        profile
    end

    def after_sign_in_path_for(resource)
        profile_url(resource)
    end


    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end

end
