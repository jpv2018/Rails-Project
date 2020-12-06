class JudgePlayersController < ApplicationController

    def index
        @players = Player.all
        @player = Player.find_by(params[:player_id])
        @score = Score.new
        @player_score = Score.find_by(judge_id: params[:judge_id], player_id: params[:player_id])
    end

    def new
    end

end
