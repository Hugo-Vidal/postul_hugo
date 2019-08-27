desc "10.000 money to every player at the end of the day"
task players_end_day: :environment do
    puts "+10.000 to all players"
    @players = Player.all
    @players.each do |player|
        player.money += 10000
        player.save
    end
end