require './lib/tic_tac_toe.rb'
# require './bin/main'

RSpec.describe Board do
  subject { Board }
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

  # condition = .instance_of Integer && 
  # board_range = (num_start..num_end).to_a
  # picked_slot = board_range.sample
  # .include?()

  describe '#pick_slot' do
    subject { Player.new('Ruby', 'x') }
    context 'when the game is being played, this' do
      it 'allows the player to pick a slot number from the board' do
        board_range = (num_start..num_end).to_a
        picked_slot = board_range.sample
        # picked_slot = subject.pick_slot
        expect(board_range.include? picked_slot).to eql(true)
      end
    end

    # context 'when the game is started, this' do
    #   it 'does not return an empty hash' do
    #     expect(subject.squares).to_not eql(Hash.new)
    #   end
    # end
  end
end

describe Game do
end

describe Scoreboard do
end

describe AutoPlayer do
end

describe AutoGame do
end