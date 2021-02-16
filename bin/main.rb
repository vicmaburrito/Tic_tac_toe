#!/usr/bin/env ruby

puts 'Welcome to your Tic Tac Toe game'

puts 'Player 1 enter your name'
Player1 = gets.chomp

puts 'Player 2 enter your name'
Player2 = gets.chomp

game_status = [1, 2, 3, 4, 5, 6, 7, 8, 9]

puts "#{game_status[0]} | #{game_status[1]} | #{game_status[2]} \n ---------
\n#{game_status[3]} | #{game_status[4]} | #{game_status[5]}\n ---------
\n#{game_status[6]} | #{game_status[7]} | #{game_status[8]}"

puts "#{Player1} it is your turn, please make your move"
Player1Move = gets.chomp
if Player1Move.include? '10'
  puts 'Move is not valid, you loose your turn'
else
  puts "Good! #{Player1}"
end
game_status[Player1Move.to_i - 1]

puts "#{game_status[0]} | #{game_status[1]} | #{game_status[2]} \n ---------
\n#{game_status[3]} | #{game_status[4]} | #{game_status[5]}\n ---------
\n#{game_status[6]} | #{game_status[7]} | #{game_status[8]}"

puts "#{Player2} it is your turn, please make your move"
Player2Move = gets.chomp
if Player2Move.include? '10'
  puts 'Move is not valid, you loose your turn'
else
  puts "Good! #{Player2}"
end
game_status[Player2Move.to_i - 1]

puts "#{game_status[0]} | #{game_status[1]} | #{game_status[2]} \n ---------
\n#{game_status[3]} | #{game_status[4]} | #{game_status[5]}\n ---------
\n#{game_status[6]} | #{game_status[7]} | #{game_status[8]}"

if Player1Move == Player2Move
  puts 'its a draw'
else
  puts "#{Player1} it's a winner"
end
