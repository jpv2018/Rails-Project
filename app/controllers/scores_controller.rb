class ScoresController < ApplicationController
    def create
        Score.create(amount: params[:amount], judge_id: params[:judge_id], player_id: params[:player_id])
        redirect_to '/judges/:judge_id/players'
    end

    def new
        @score = Score.new
    end

    def index
        @scores = Score.all
    end
end
