class JudgesController < ApplicationController

skip_before_action :authorized, only: [:new, :create, :index]

    def create
        @judge = Judge.create(judge_params)
        session[:judge_id] = @judge.id

        if @judge.uid != nil
            @judge.password = SecureRandom.hex(9)
        end

        if @judge.valid? 
            redirect_to judge_path(@judge)
        else
            redirect_to new_judge_path, notice: "Email already exists"
        end

    end

    def index
        @judges = Judge.all
    end

    def new
        @judge = Judge.new
    end

    def show
        @judge = Judge.find(params[:id])
        @players = Player.all
    end

    def edit
        @judge = Judge.find(params[:id])
    end

    def update
        @judge = current_user
        @judge.update(params.require(:judge).permit(:organization, :first_name, :last_name, :email, :password))
        redirect_to judge_path(@judge)
    end




    private

    def judge_params
        params.require(:judge).permit(:first_name, :last_name, :organization, :email, :password, :password_confirmation)
    end

end