class PlayersController < ApplicationController
    skip_before_action :authorized

    def new
        @player = Player.new
    end

    def create
        @player = Player.create(student_params)
        redirect_to players_path
    end

    def index
        @players = Player.all
    end
    

end
