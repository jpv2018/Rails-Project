class JudgePlayersController < ApplicationController

    def index
        @players = Player.all
        @player = Player.find_by(params[:player_id])
        @judge = current_user
        @score = @player.scores.find_by(params[:id])
    end

    def new
    end

end
