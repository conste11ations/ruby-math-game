require './player'

class Game
  attr_reader :player1, :player2, :players
  attr_accessor :current_player

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = rand(1..2) == 1 ? @player1 : @player2 
    @players = [@player1, @player2]
  end

  def question_key_generator #should ideally be question class
    first_val = rand(1...10)
    second_val = rand(1...10)
    operator = ["+", "-", "/", "*"].sample
    answer = first_val.method(operator).(second_val)
    
    return first_val, second_val, operator, answer
  end

  def game_over?
    @players.any?{ |player| player.dead? }
  end

  def start

      puts "Welcome to the Ruby math game!"
      puts "#{current_player.name} begins!"

      while (!game_over?)

        fv, sv, o, a = question_key_generator
        puts "#{current_player.name}: What does #{fv} #{o} #{sv} equal?"
        print "> "
        response = $stdin.gets.chomp

        if response == a.to_s
          puts "#{current_player.name}: YES! You are correct."
        else 
          puts "#{current_player.name}: Seriously? No!"
          current_player.loses_lives(1)
        end

        puts "#{player1.status} vs #{player2.status}"
        @current_player = @current_player == @player1 ? @player2 : @player1
        puts "------- NEW current_player -------"
      end

      winner = @player1.dead? ? @player2 : @player1
      puts "#{winner.name} wins with a score of #{winner.status[-3,3]}" #works now but should remove hardcoding
      puts  "------- GAME OVER ---------\nGood bye!"
  end

end