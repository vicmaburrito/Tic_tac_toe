#!/usr/bin/env ruby
puts 'INSTRUCTIONS'
puts '---------------------------------------------------'
puts 'A number represents each square spaces on the board'
puts 'from 1 up to 9. To make a move specifies a number'
puts 'in the range of possible numbers at each step into'
puts 'the game. It\'s that simple :). Enjoy!!!'

puts 'Welcome to your Tic Tac Toe game'

puts 'Player 1 enter your name'
Player1 = gets.chomp

puts 'Player 2 enter your name'
Player2 = gets.chomp

game_status = [1, 2, 3, 4, 5, 6, 7, 8, 9]
wins = false
start = 2

# now i'll display the board and an array whith each available moves

while start < 11

  # here a methode will be responsible to display the board after each player's move.
  # the board will display after each player,s move except for the first time we start.

  puts "#{game_status[0]} | #{game_status[1]} | #{game_status[2]} \n ---------
\n#{game_status[3]} | #{game_status[4]} | #{game_status[5]}\n ---------
\n#{game_status[6]} | #{game_status[7]} | #{game_status[8]}"

  if start.even?
    current_player = Player1
    puts "#{current_player} it's your turn, please mark a valid move number from 1 to 9 as shown on the board! "
    player_1_turn = gets.chomp.to_i
  else
    current_player = Player2
    puts "#{current_player} it's your turn, please mark a valid move number from 1 to 9 as shown on the board!"
    player_2_turn = gets.chomp.to_i
  end
  # here instead of using the if that way i'll check if the number i got from the player
  # input is included in the array of possible moves left i'll create later
  # same for each player

  puts 'Move is not valid' if player_1_turn < 1 && player_1_turn > 9

  puts "#{game_status[0]} | #{game_status[1]} | #{game_status[2]} \n ---------
  \n#{game_status[3]} | #{game_status[4]} | #{game_status[5]}\n ---------
  \n#{game_status[6]} | #{game_status[7]} | #{game_status[8]}"
  # here instead of checking for only the move each player make i'll check for
  # possible move left, rather the player enter a wrong move, and check the wins cases.
  if wins
    puts "#{current_player} is the winner!"
    break
  end

  start += 1

end

puts "there's a draw" if wins == false
puts player_1_turn
puts player_2_turn
