require './lib/tic_tac_toe.rb'

RSpec.describe Board do
  describe '#self.make_board' do
    context 'when game is started, this' do
      it 'makes the board available for game play' do
        Board.make_board
        squares = Board.squares

        num_start = 1
        num_end = 9
        board_slot_sign = '-'
        board_range = (num_start..num_end).to_a
        cells = Hash.new

        board_range.each do |key|
          cells[key] = board_slot_sign
        end
        expect(squares).to eql(cells)
      end
    end
  end

  describe '#self.squares' do
    context 'when game is started, this' do
      it 'returns an object of board slots' do
        board_cells = Board.squares

        num_start = 1
        num_end = 9
        board_slot_sign = '-'
        board_range = (num_start..num_end).to_a
        slots = Hash.new

        board_range.each do |key|
          slots[key] = board_slot_sign
        end
        expect(board_cells).to eql(slots)
      end
    end
  end

  describe '#self.reset' do
    context 'when a round of play is ended, this' do
      it 'returns an object of board slots values that have no numbers' do
        Board.make_board
        slot1 = Board.squares

        num_start = 1
        num_end = 9
        board_slot_sign = '-'
        board_range = (num_start..num_end).to_a
        empty_board_slots = Hash.new

        board_range.each do |key|
          empty_board_slots[key] = board_slot_sign
        end
        expect(slot1).to eql(empty_board_slots)
      end
    end
  end
end

describe Player do
end

describe Game do
end

describe Scoreboard do
end

describe AutoPlayer do
end

describe AutoGame do
end