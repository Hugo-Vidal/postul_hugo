class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
    temperature = [24, 24, 24, 24, 24, 24]

      @rulette = random_weighted(green: 2, red: 49, black: 49)
      @players.each do |player|
        player.bet = random_weighted(green: 2, red: 49, black: 49)

        if player.money == 0
          player.wager = 0
        elsif player.money <= 1000
          player.wager = player.money
        elsif temperature.max >= 25
          player.wager = player.money * (rand(3..7))/100
        else
          player.wager = player.money * (rand(8..15))/100
        end

        if @rulette.to_s == "green" && player.bet.to_s == "green"
          player.money += 15*player.wager
        elsif @rulette.to_s == player.bet.to_s
          player.money += 2*player.wager
        else
          player.money -= player.wager
        end
        player.save
      end
  end
    

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :money)
    end

    def random_weighted(weighted)
      max    = sum_of_weights(weighted)
      target = rand(1..max)
      weighted.each do |item, weight|
        return item if target <= weight
        target -= weight
      end
    end
  
    def sum_of_weights(weighted)
      weighted.inject(0) { |sum, (item, weight)| sum + weight }
    end

end
