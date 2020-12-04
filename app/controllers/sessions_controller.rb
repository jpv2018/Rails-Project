class SessionsController < ApplicationController

    def create  
        @judge = Judge.find_by(email: params[:email])
        if @judge && @judge.authenticate(params[:password])
            sessions[:judge_id] = @judge.id
            redirect_to '/welcome'
        else
            redirect_to '/login'
        end
        
    end

end
