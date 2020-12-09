class SessionsController < ApplicationController

skip_before_action :authorized, only: [:new, :create, :welcome]

    def new
        @judge = Judge.new
    end

    def create  
        if request.env["omniauth.auth"]
        @judge = Judge.find_or_create_by(uid: auth['uid']) do |j|
            j.first_name = auth['info']['first_name']
            j.last_name = auth['info']['last_name']
            j.email = auth['info']['email']
            j.password = SecureRandom.hex(9)
            end
        session[:judge_id] = @judge.id
        redirect_to judge_path(@judge)
        else
            @judge = Judge.find_by(email: params[:email])
            if @judge && @judge.authenticate(params[:password])
                session[:judge_id] = @judge.id
                redirect_to judge_path(@judge)
            else
                @judge = Judge.new
                render '/sessions/new'
            end
        end
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
