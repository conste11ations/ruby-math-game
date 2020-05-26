require './player'

class Game
  attr_reader :players
  attr_accessor :turn

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @turn = rand(1..2) == 1 ? @player1 : @player2
    @players = [@player1, @player2]
  end

  def question_key_generator
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
      puts "#{turn.name} begins!"
      while (!game_over?)

        fv, sv, o, a = question_key_generator
        puts "#{turn.name}: What does #{fv} #{o} #{sv} equal?"
        response = $stdin.gets.chomp

        if response == a.to_s
          puts "#{turn.name}: YES! You are correct"
        else 
          puts "#{turn.name}: Seriously? No! >> #{a}"
          turn.update_lives(-1)
        end

        first_half_sentence = "#{turn.status} vs "
        @turn = @turn == @player1 ? @player2 : @player1
        puts first_half_sentence + "#{turn.status}"

      end
      winner = @player1.dead? ? @player2 : @player1
      puts "#{winner.name} wins with a score of #{winner.status[-3,3]}"
      puts  "------- GAME OVER ---------\nGood bye!"
  end

end