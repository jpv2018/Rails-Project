class JudgePlayersController < ApplicationController

    def index
        @players = Player.all
        @player = Player.find_by(params[:player_id])
        @score = Score.new
        @judge = current_user
    end

    def new
    end

end
