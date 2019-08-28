desc "Roulette game every 3 minutes"
task rouletter: :environment do
    puts "New roulette game played"

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

    def temperature
        client = Apixu::Client.new(ENV["APIXU_SECRET_KEY"])
        @forecast = client.forecast([-33.4726900, -70.6472400], 7)
        @days = @forecast['forecast']['forecastday']
        @temperature_santiago_7 = []
        @days.each do |day|
            @temperature_santiago_7.push(day['day']['maxtemp_c'])
        end
        return @temperature_santiago_7
    end

    @players = Player.all
    @roulettes = Roulette.all
    @temperature = temperature()
    @game_win = random_weighted(green: 2, red: 49, black: 49)
    Roulette.last != nil ? @game = Roulette.last.game.to_i + 1 : @game = 1

    @players.each do |player|
    if player.money == 0
        player.wager = 0
    elsif player.money <= 1000
        player.wager = player.money
    elsif @temperature.max > 25
        player.wager = player.money * (rand(3..7))/100
    else
        player.wager = player.money * (rand(8..15))/100
    end

    player.bet = random_weighted(green: 2, red: 49, black: 49)
    if @game_win.to_s == "green" && player.bet.to_s == "green"
        player.money += 15*player.wager
    elsif @game_win.to_s == player.bet.to_s
        player.money += 2*player.wager
    else
        player.money -= player.wager
    end
    player.save
    @roulette = Roulette.new(name: player.name, money: player.money, bet: player.bet, wager: player.wager, result: @game_win, game: @game)
    @roulette.save
    end
    
end

desc "10.000 money to every player at the end of the day"
task players_end_day: :environment do
    puts "+10.000 to all players"
    @players = Player.all
    @players.each do |player|
        player.money += 10000
        player.save
    end
end