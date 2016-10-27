require_relative "chess_board"

class Chess
    attr_reader :board
    def initialize
        @board = ChessBoard.new   
    end 
end