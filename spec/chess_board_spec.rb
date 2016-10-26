require 'chess_board'

describe 'ChessBoard' do
    let(:board) {ChessBoard.new}
    
    context "#initialize" do
        it { expect(board.squares.size).to eq(64)}
    end
end