require './lib/die'
require './lib/game'
require './lib/player'
require './lib/turn'


puts "Welcome to Pig!\n\n"
players = [Player.new("Mops"), Player.new("Mustang")]
game = Game.new(players)
die = Die.new

until game.over?
  players.each do |player|
    puts "#{player.name}, your turn.\n\n"
    turn = Turn.new(player)

    until turn.over?
      turn.roll(die)
      puts "You rolled a #{die.roll}."
      unless turn.over?
        puts "So far this turn, you have #{turn.points} points."
        puts "Press 'h' to hold or any other key to roll again.\n\n"
        player_choice = gets.chomp
        turn.hold if player_choice == 'h'
      end
    end

    puts "You got #{turn.points} points this turn."
    puts "You have #{player.points} points total.\n\n\n"
  end
end

puts "Congratulations, #{game.winner.name}. You win!"