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
            redirect_to new_player_path, notice: "Player Already Exists"
        end
    end

    def results
        @players = Player.all
    end
    
    def index
        redirect_to '/welcome' unless !logged_in?
        @players = Player.all
        if params[:search]
            @player = Player.search_school(params[:search])
        else
            @player = Player.all
        end
    end


    private

    def player_params
        params.require(:player).permit(:first_name, :last_name, :school, :email)
    end

end
