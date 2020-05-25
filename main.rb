
require 'pp'
require './game'
require './player'

puts "Welcome to the ruby math game!"

player1 = Player.new("Jane")
player2 = Player.new("Tina")
a_game = Game.new()

response = $stdin.gets.chomp
puts player1.name
puts player1.lives
question1 = a_game.question_key_generator()
puts question1.first_val

puts "Good bye!"
