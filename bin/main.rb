#!/usr/bin/env ruby
class Board
    attr_accessor :board
  
    def initialize
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  
    def display_board
      puts "#{board[0]} | #{board[1]} | #{board[2]}\n---------\n#{board[3]} | #{board[4]} | #{board[5]}\n---------
      \n#{board[6]} | #{board[7]} | #{board[8]}"
    end
end

class Player
    attr_reader :name, :sign
    attr_accessor :record
  
    def initialize(name, sign)
      @name = name
      @sign = sign
      @record = []
    end
  end
 