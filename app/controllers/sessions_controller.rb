class SessionsController < ApplicationController

skip_before_action :authorized, only: [:new, :create, :welcome]

    def new

    end

    def create  
        @judge = Judge.find_or_create_by(uid: auth['uid']) do |j|
            j.first_name = auth['info']['first_name']
            j.last_name = auth['info']['last_name']
            j.email = auth['info']['email']
        end

        session[:judge_id] = @judge.id

        render 'welcome'
    end

    def destroy
        session.delete(:judge_id)
        redirect_to '/welcome'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
