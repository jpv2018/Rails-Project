class PlayersController < ApplicationController
    skip_before_action :authorized


    def new
        @player = Player.new
    end

    def create
        @player = Player.create(player_params)
        if @player.valid?
        redirect_to players_path
        else
            redirect_to '/players/new'
        end
    end

    def results
        @players = Player.all
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
