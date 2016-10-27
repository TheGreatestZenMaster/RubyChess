require 'colorize'

class ChessBoard
    attr_reader :squares
    
    def initialize
        build_board(8,8)
    end
    
    def build_board(cols, rows)
        @squares = Array.new
        (1..cols).each do |column|
            (1..rows).each do |row|
                @squares << [column,row]
            end
        end
    end
end

pieces = Hash(  :white => { :king => "\u2654".encode('utf-8').white, :queen => "\u2655".encode('utf-8').white, 
                            :rook => "\u2656".encode('utf-8').white, :bishop => "\u2657".encode('utf-8').white, 
                            :knight => "\u265B".encode('utf-8').white, :pawn => "\u2659".encode('utf-8').white}, 
                :black => {:king => "\u2654".encode('utf-8').red, :queen => "\u2655".encode('utf-8').red, 
                            :rook => "\u2656".encode('utf-8').red, :bishop => "\u2657".encode('utf-8').red, 
                            :knight => "\u265B".encode('utf-8').red, :pawn => "\u2659".encode('utf-8').red})
space = Hash(:white => "\u2652".encode('utf-8').white, :black => "\u2652".encode('utf-8').black)

chess = ChessBoard.new
puts chess.squares.inspect

puts space[:white]*3 + space[:black]*3 + space[:white]*3

puts (space[:white] + "#{pieces[:white][:king]}" + space[:white]) + space[:black] +"#{pieces[:black][:knight]}" + space[:black] + space[:white]*3

puts space[:white]*3 + space[:black]*3 + space[:white]*3

puts space[:black]*3 + space[:white]*3 + space[:black]*3 
puts space[:black] + "#{pieces[:white][:bishop]}" + space[:black] + space[:white]*3 + space[:black]*3 
puts space[:black]*3 + space[:white]*3 + space[:black]*3

puts space[:white]*3 + space[:black]*3 + space[:white]*3
puts space[:white]*3 + space[:black]*3 + space[:white]*3
puts space[:white]*3 + space[:black]*3 + space[:white]*3