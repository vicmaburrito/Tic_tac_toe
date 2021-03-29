require './lib/tic_tac_toe.rb'

RSpec.describe Board do
  describe '#self.squares' do
    context 'when game is started,' do
      it 'returns an object of board slots' do
        board_cells = Board.squares
        slots = {
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
        expect(board_cells).to eql(slots)
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