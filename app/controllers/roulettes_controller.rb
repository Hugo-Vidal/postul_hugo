class RoulettesController < ApplicationController

    def index
        @players = Player.all
        @roulettes = Roulette.all
    end
end
