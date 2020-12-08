class SessionsController < ApplicationController

skip_before_action :authorized, only: [:new, :create, :welcome]

    def new

    end

    def create  
        if request.env["omniauth.auth"]
        @judge = Judge.find_or_create_by(uid: auth['uid']) do |j|
            j.first_name = auth['info']['first_name']
            j.last_name = auth['info']['last_name']
            j.email = auth['info']['email']
            session[:judge_id] = @judge.id
        end

        else
            judge = Judge.find_by(:email => params[:email])
            if judge &&judge.authenticate(params[:password])
                session[:judge_id] = judge.id
            end
        end


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
