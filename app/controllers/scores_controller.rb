class ScoresController < ApplicationController
    def create
        @score = Score.create(score_params)
        @score.save
        redirect_to '/judges/:judge_id/players'
    end

    def new
        @score = Score.new
    end

    def index
        @scores = Score.all
    end

    def edit
        @score = Score.find(params[:id])
        @judge = Judge.find_by(params[:judge_id])
        @player = Player.find(params[:player_id])
    end

    def update
        @judge = current_user
        @score = Score.find(params[:id])
        @score.update(params.require(:score).permit(:amount, :judge_id, :player_id))
        redirect_to judge_players_path(@judge)
    end

    def show
        @score = Score.find_by(judge_id: params[:judge_id], player_id: params[:player_id])
    end

    def destroy
        @judge = current_user
        @score = Score.find(params[:id])
        @score.destroy
        redirect_to judge_players_path(@judge)
    end


    private

    def score_params
        params.require(:score).permit(:amount, :judge_id, :player_id)
    end

end
