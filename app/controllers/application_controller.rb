class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
    add_flash_types :danger, :info, :warning, :success
    def current_user
        Judge.find_by(id: session[:judge_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def authorized

        redirect_to '/welcome' unless logged_in?

    end


end
