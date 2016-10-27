require 'chess'

describe "Chess" do
    let(:chess) { Chess.new }
    context "#initialize" do
       it { expect(chess).to be_instance_of(Chess) } 
       it { expect(chess.board).to be_instance_of(ChessBoard)}
    end
end