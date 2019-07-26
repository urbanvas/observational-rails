class ApplicationController < ActionController::Base
    helper_method :current_user

    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def layout
        @planets = Planet.all ? Planet.all : nil
        @systems = System.all ? System.all : nil
        @galaxies = Galaxy.all ? Galaxy.all : nil
    end
end
