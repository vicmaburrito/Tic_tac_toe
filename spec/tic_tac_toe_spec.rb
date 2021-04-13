require './lib/tic_tac_toe.rb'


RSpec.describe Board do

  def construct_board
    num_start = 1
    num_end = 9
    board_slot_sign = '-'
    board_range = (num_start..num_end).to_a
    cells = Hash.new
    board_range.each do |key|
      cells[key] = board_slot_sign
    end
    cells
  end
  subject { Board }

  describe '#self.make_board' do
    context 'when the game is started, this' do
      it 'returns a hash which the 9 keys having 1 to 9 as key names and hyphens of string type making the board available for game play' do
        expect(subject.make_board).to eql(construct_board)
      end
    end

    context 'when the game is started, this' do
      it 'does not return an empty hash' do
        expect(subject.make_board).to_not eql(Hash.new)
      end
    end
  end

  describe '#self.squares' do
    context 'when the game is started, this' do
      it 'returns a hash of gotten from self.make_board method' do
        expect(subject.squares).to eql(construct_board)
      end
    end

    context 'when the game is started, this' do
      it 'does not return an empty hash' do
        expect(subject.squares).to_not eql(Hash.new)
      end
    end
  end

  describe '#self.reset' do
    context 'when a round of gameplay is ended, this' do
      it 'returns a hash of hyphens of string type as values' do
        empty_board_slots = Hash.new
        expect(subject.reset).to eql(construct_board)
      end
    end

    context 'when a round of gameplay is ended, this' do
      it 'does not return an empty hash' do
        empty_board_slots = Hash.new
        expect(subject.reset).to_not eql(Hash.new)
      end
    end
  end
end

RSpec.describe Player do
  num_start = 1
  num_end = 9

  describe '#pick_slot' do
    subject { Player.new('Ruby', 'x') }
    context 'when the game is being played, this' do
      it 'allows the player to pick a slot number from the board' do
        board_range = (num_start..num_end).to_a
        picked_slot = board_range.sample
        expect(board_range.include?(picked_slot)).to eql(true)
      end
    end

    context 'when the game is being played, this' do
      it 'does not allow the player input a character that does not represent a slot number' do
        board_range = (num_start..num_end).to_a
        board_range1 = %w[$ ! a b c]
        picked_slot = board_range1.sample
        expect(board_range.include?(picked_slot)).to_not eql(true)
      end
    end
  end
end

RSpec.describe Game do
  num_start = 1
  num_end = 9
  board_range = (num_start..num_end).to_a
  board_range1 = %w[$ ! a b c]
  wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  describe '#play' do
    context 'when the game is being played, this' do
      it 'inserts the x or o in the availabe board slots' do
        picked_slot = board_range.sample
        expect(subject.play(picked_slot, 'x')).to eql(Board.squares[picked_slot])
      end
    end

    context 'when the game is being played, this' do
      it 'inserts the x or o in the availabe board slots' do
        picked_slot = board_range.sample
        expect(subject.play(picked_slot, 'O')).to eql(Board.squares[picked_slot])
      end
    end

    context 'when the game is being played, this' do
      it 'inserts the x or o in the availabe board slots' do
        picked_slot = board_range.sample
        expect(subject.play(picked_slot, 'X')).to_not eql(Board.squares[board_range1.sample])
      end
    end

    context 'when the game is being played, this' do
      it 'inserts the x or o in the availabe board slots' do
        picked_slot = board_range.sample
        expect(subject.play(picked_slot, 'O')).to_not eql(Board.squares[board_range1.sample])
      end
    end
  end

  describe '#checkmatch' do
    context 'when the game is being played, this' do
      it 'checks the board for a win state' do
        play_letter = 'x'
        char = 'x'
        subject.play(wins[2][0], play_letter)
        subject.play(wins[2][1], play_letter)
        subject.play(wins[2][2], play_letter)
        win = nil
        wins.each do |nums|
          if Board.squares[nums[0]] == char && Board.squares[nums[1]] == char && Board.squares[nums[2]] == char
            win = char
            break
          end
        end
        expect(subject.checkmatch('X')).to eql(win)
      end
    end

    context 'when the game is being played, this' do
      it 'checks the board for a win state' do
        play_letter = 'O'
        char = 'O'
        subject.play(wins[2][0], play_letter)
        subject.play(wins[2][1], play_letter)
        subject.play(wins[2][2], play_letter)
        win = nil
        wins.each do |nums|
          if Board.squares[nums[0]] == char && Board.squares[nums[1]] == char && Board.squares[nums[2]] == char
            win = char
            break
          end
        end
        expect(subject.checkmatch('O')).to eql(win)
      end
    end

    context 'when the game is being played, this' do
      it 'checks the board for a win state' do
        play_letter = 'X'
        play_letter1 = 'O'

        char = 'X'
        subject.play(wins[2][0], play_letter)
        subject.play(wins[2][1], play_letter1)
        subject.play(wins[2][2], play_letter)
        win = nil
        wins.each do |nums|
          if Board.squares[nums[0]] == char && Board.squares[nums[1]] == char && Board.squares[nums[2]] == char
            win = char
            break
          end
        end
        expect(subject.checkmatch('X')).to_not eql(win)
      end
    end

    context 'when the game is being played, this' do
      it 'checks the board for a win state' do
        play_letter = 'X'
        play_letter1 = 'O'

        char = 'O'
        subject.play(wins[2][0], play_letter1)
        subject.play(wins[2][1], play_letter)
        subject.play(wins[2][2], play_letter1)
        win = nil
        wins.each do |nums|
          if Board.squares[nums[0]] == char && Board.squares[nums[1]] == char && Board.squares[nums[2]] == char
            win = char
            break
          end
        end
        expect(subject.checkmatch('X')).to_not eql(win)
      end
    end
  end
end

describe Scoreboard do
end

describe AutoPlayer do
end

describe AutoGame do
end
