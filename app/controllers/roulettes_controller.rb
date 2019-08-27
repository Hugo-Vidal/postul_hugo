class RoulettesController < ApplicationController
    
    def index
        @players = Player.all
        @roulettes = Roulette.all
        @games = @roulettes.group_by(&:game).sort.reverse
    end
end
