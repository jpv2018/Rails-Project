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

    def update
        @score.update(params.require(:score).permit(:judge_id, :player_id))
    end

    private

    def score_params
        params.require(:score).permit(:amount, :judge_id, :player_id)
    end

end
