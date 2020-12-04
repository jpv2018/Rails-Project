class JudgesController < ApplicationController

skip_before_action :authorized, only: [:new, :create, :index]

    def create
        @judge = Judge.create(judge_params)
        session[:judge_id] = @judge.id
        redirect_to judge_path(@judge)
    end

    def index
        @judges = Judge.all
    end

    def new
        @judge = Judge.new
    end

    def show
        @judge = Judge.find(params[:id])
    end

    

    private

    def judge_params
        params.require(:judge).permit(:first_name, :last_name, :organization, :email, :password, :password_confirmation)
    end

end
