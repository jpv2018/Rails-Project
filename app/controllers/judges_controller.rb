class JudgesController < ApplicationController

    def create(judge_params)
        Judge.create(judge_params)
        self.judge_number = self.id
    end

    def index
        @judges = Judge.all
    end
    
    private

    def judge_params
        params.require(:judge).permit(:first_name, :last_name, :organization, :email, :password, :password_confirmation)
    end

end
