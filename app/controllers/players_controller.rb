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
            render :new
        end
    end

    def results
        @players = Player.all
    end
    
    def index
        redirect_to '/welcome' unless !logged_in?
        if params[:search]
            @players = Player.all.school_search(params[:search])
        else
            @players = Player.all
        end
    end


    private

    def player_params
        params.require(:player).permit(:first_name, :last_name, :school, :email, :search)
    end

end
