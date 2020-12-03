class JudgesController < ApplicationController

    def create(judge_params)
        Judge.create(judge_params)
    end

    private

    def judge_params
        params.require(:judge).permit(:email, :password, :password_confirmation)
    end
    
end
