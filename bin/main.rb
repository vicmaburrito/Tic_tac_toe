#!/usr/bin/env ruby

puts 'Welcome to your Tic Tac Toe game'

puts 'Player 1 enter your name'
Player1 = gets.chomp

puts 'Player 2 enter your name'
Player2 = gets.chomp

game_status = [1, 2, 3, 4, 5, 6, 7, 8, 9]
wins = false
start = 2

while start < 11

  puts "#{game_status[0]} | #{game_status[1]} | #{game_status[2]} \n ---------
\n#{game_status[3]} | #{game_status[4]} | #{game_status[5]}\n ---------
\n#{game_status[6]} | #{game_status[7]} | #{game_status[8]}"

  if start.even?
    current_player = Player1
    puts "#{current_player} it is your turn, please make your move"
    player_1_turn = gets.chomp.to_i
  else
    current_player = Player2
    puts "#{current_player} it is your turn, please make your move"
    player_2_turn = gets.chomp.to_i
  end

  puts 'Move is not valid' if player_1_turn < 1 && player_1_turn > 9

  puts "#{game_status[0]} | #{game_status[1]} | #{game_status[2]} \n ---------
  \n#{game_status[3]} | #{game_status[4]} | #{game_status[5]}\n ---------
  \n#{game_status[6]} | #{game_status[7]} | #{game_status[8]}"
  if wins
    puts "#{current_player} is the winner!"
    break
  end

  start += 1

end

puts "there's a draw" if wins == false
puts player_1_turn
puts player_2_turn
