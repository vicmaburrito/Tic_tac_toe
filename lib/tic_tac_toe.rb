# rubocop:disable Style/ClassVars

module Methods
  def display_guide
    puts "
		"
    puts '1 | 2 | 3'
    puts '---------'
    puts '4 | 5 | 6'
    puts '---------'
    puts '7 | 8 | 9'
    puts "
		"
  end

  def choose(name0, arr0)
    puts "its #{name0}'s turn to choose a number from #{arr0}"
  end
end

class Board
  @@squares = {
    1 => '-',
    2 => '-',
    3 => '-',
    4 => '-',
    5 => '-',
    6 => '-',
    7 => '-',
    8 => '-',
    9 => '-'
  }

  def self.squares
    @@squares
  end

  def self.reset
    @@squares = {
      1 => '-',
      2 => '-',
      3 => '-',
      4 => '-',
      5 => '-',
      6 => '-',
      7 => '-',
      8 => '-',
      9 => '-'
    }
  end
end

class Player
  include Methods
  attr_reader :name, :letter

  def initialize(name, letter)
    @name = name
    @letter = letter
  end

  def pick_slot
    loop do
      board = Board.squares.select { |_key, value| value == '-' }
      arr1 = []
      board.each { |k, _v| arr1 << k }
      display_guide
      choose(@name, arr1)
      @slot = gets.chomp.to_i
      break if board[@slot] == '-'
    end
    @slot
  end
end

class Game
  include Methods

  def play(board_slot, character)
    Board.squares[board_slot] = character
    display_guide
    display_slots
  end

  def checkmatch(char)
    win_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    win_combinations.each do |nums|
      return char if Board.squares[nums[0]] == char && Board.squares[nums[1]] == char && Board.squares[nums[2]] == char
    end
  end

  def display_slots
    puts "#{Board.squares[1]}  #{Board.squares[2]}  #{Board.squares[3]}"
    puts "#{Board.squares[4]}  #{Board.squares[5]}  #{Board.squares[6]}"
    puts "#{Board.squares[7]}  #{Board.squares[8]}  #{Board.squares[9]}"
    puts "
    "
  end
end

class Scoreboard
  attr_reader :x_score, :o_score

  def initialize
    @x_score = 0
    @o_score = 0
  end

  def increment_score(char)
    @x_score += 1 if char == 'X'
    @o_score += 1 if char == 'O'
  end
end

class AutoPlayer < Player
  def pick_slot
    board = Board.squares.select { |_key, value| value == '-' }
    arr1 = []
    board.each { |k, _v| arr1 << k }
    display_guide
    choose(@name, arr1)
    loop do
      @slot = arr1.sample
      break if board[@slot] == '-'
    end
    @slot
  end
end

class AutoGame < Game; end

# rubocop:enable Style/ClassVars
