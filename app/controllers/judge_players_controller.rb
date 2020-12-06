class JudgePlayersController < ApplicationController

    def index
        @players = Player.all
        @score = Score.new
        @player_score = Score.find_by(judge_id: params[:player_id])
    end

    def new
    end

end
