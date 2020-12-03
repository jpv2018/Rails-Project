class SessionsController > ApplicationController

    def create @judge = Judge.find_by(email: params[:email])
        return head(:forbidden) unless @judge.authenticate(params[:password])
        session[:judge_id] = @judge.id
    end
end
