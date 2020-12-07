class SessionsController < ApplicationController

skip_before_action :authorized, only: [:new, :create, :welcome]

    def new

    end

    def create  
        @judge = Judge.find_by(email: params[:email])
        if @judge && @judge.authenticate(params[:password])
            session[:judge_id] = @judge.id
            redirect_to judge_path(@judge)
        else
            redirect_to login_path, danger: "Invalid email or password"
        end

    end

    def destroy
        session.delete(:judge_id)
        redirect_to '/welcome'
    end


end
