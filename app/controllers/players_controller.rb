class PlayersController < ApplicationController
    skip_before_action :authorized

    def new
        @player = Player.new
    end

    def create
        @player = Player.create(player_params)
        @player.score = 0
        redirect_to players_path
    end

    def index
        redirect_to '/welcome' unless !logged_in?
        @players = Player.all
    end

    private

    def player_params
        params.require(:player).permit(:first_name, :last_name, :school, :email)
    end

end
