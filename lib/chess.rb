require_relative "chess_board"
require_relative "player"

class Chess
    attr_reader :board, :player1, :player2
    def initialize
        @player1 = Player.new("white")
        @player2 = Player.new("black")
        @board = ChessBoard.new  
        tests
    end 
    
    def tests
        @board.display
        player1.choose_piece(@board)
    end
end

chess = Chess.new