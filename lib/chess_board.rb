require 'colorize'

class ChessBoard
    attr_reader :squares, :pieces, :space
    
    def initialize
        build_board(8,8)
        @pieces = Hash( :white => { :king => "\u2654".encode('utf-8').white, :queen => "\u2655".encode('utf-8').white, 
                                    :rook => "\u2656".encode('utf-8').white, :bishop => "\u2657".encode('utf-8').white, 
                                    :knight => "\u265B".encode('utf-8').white, :pawn => "\u2659".encode('utf-8').white}, 
                        :black => {:king => "\u2654".encode('utf-8').red, :queen => "\u2655".encode('utf-8').red, 
                                    :rook => "\u2656".encode('utf-8').red, :bishop => "\u2657".encode('utf-8').red, 
                                    :knight => "\u265B".encode('utf-8').red, :pawn => "\u2659".encode('utf-8').red})
        @space = Hash(:white => "\u2652".encode('utf-8').white, :black => "\u2652".encode('utf-8').black)
        starting_positions
        display
    end
    
    def build_board(cols, rows)
        @squares = Hash.new
        (1..cols).each do |column|
            (1..rows).each do |row|
                @squares[[column,row]] = nil
            end
        end
    end
    
    def starting_positions
        (1..8).each do |column|
            @squares[[column, 2]] = @pieces[:white][:pawn]
            @squares[[column, 7]] = @pieces[:black][:pawn]
            if column == 1 || column == 8
                @squares[[column, 1]] = @pieces[:white][:rook]
                @squares[[column, 8]] = @pieces[:black][:rook]
            elsif column == 2 || column == 7
                @squares[[column, 1]] = @pieces[:white][:knight]
                @squares[[column, 8]] = @pieces[:black][:knight]
            elsif column == 3 || column == 6
                @squares[[column, 1]] = @pieces[:white][:bishop]
                @squares[[column, 8]] = @pieces[:black][:bishop]
            elsif column == 4
                @squares[[column, 1]] = @pieces[:white][:queen]
                @squares[[column, 8]] = @pieces[:black][:king]
            else
                @squares[[column, 1]] = @pieces[:white][:king]
                @squares[[column, 8]] = @pieces[:black][:queen]
            end
        end
        
    end
        
    
    def piece_output(column,row, color)
        square = @squares[[column,row]]
        square.nil?? @space[color.to_sym]: square
    end
    
    def display
        8.downto(1).each do |row|
            (1..3).each do |section|
                row_output = ""
                (1..8).each do |column|
                    if row % 2 == 0 
                        if column % 2 == 1
                            (section % 2 == 1)? row_output << @space[:white]*3: row_output << @space[:white] + "#{piece_output(column,row,"white")}" + @space[:white]
                        elsif column % 2 == 0
                            (section % 2 == 1)? row_output << @space[:black]*3: row_output << @space[:black] + "#{piece_output(column,row,"black")}" + @space[:black]
                        end
                    elsif row % 2 == 1 && 
                        if column % 2 == 1
                            (section % 2 == 1)? row_output << @space[:black]*3: row_output << @space[:black] + "#{piece_output(column,row,"black")}" + @space[:black]
                        elsif column % 2 == 0
                            (section % 2 == 1)? row_output << @space[:white]*3: row_output << @space[:white] + "#{piece_output(column,row,"white")}" + @space[:white]
                        end
                    end
                end
            puts row_output
            end
        end
    end
end



chess = ChessBoard.new
