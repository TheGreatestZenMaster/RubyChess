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
        piece_choice = choose_piece(@player1)
        piece_move = choose_move(@player1, piece_choice)
        @board.move_piece(piece_choice, piece_move)
        @board.display
    end
    
    def choose_piece(player)
        begin
            puts "Choose a piece like this '1,1'!"
            position = gets.chomp.split(",").map{|x|x.to_i}
        end until player.check_color(@board.squares[position]) 
        @board.squares[position]
    end
    
    def choose_move(player, piece)
        begin
            puts "Choose a place to move to!"
            position = gets.chomp.split(",").map{|x|x.to_i}
        end until piece.valid_moves(position)
        puts "move made"
        return position
    end
end

chess = Chess.new