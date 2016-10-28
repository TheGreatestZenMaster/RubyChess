class Game_Piece
    attr_accessor :location, :color, :symbol
    
    def initialize(location, color)
        @location = location
        color == "white"? @color = color: @color = "black"
    end
end

class Pawn < Game_Piece
    
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2659".encode('utf-8').white: @symbol= "\u2659".encode('utf-8').red
    end
    
    def valid_moves(position)
        moves = Array.new
        valid_move = false
        if @color == "white"
            @location[1] == 2? (1..2).each {|x| moves << [@location[0] ,@location[1]+x] }: moves << [@location[0] ,@location[1]+1]
        else
            @location[1] == 7? (1..2).each {|x| moves << [@location[0] ,@location[1]-x] }: moves << [@location[0] ,@location[1]-1]
        end
        moves.include?(position)? valid_move = true: (puts "That's not a valid move for that piece!")
        valid_move
    end
end

class Rook < Game_Piece
    
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2656".encode('utf-8').white: @symbol= "\u2656".encode('utf-8').red
    end
end

class Knight < Game_Piece

    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u265B".encode('utf-8').white: @symbol= "\u265B".encode('utf-8').red
    end
end

class Bishop < Game_Piece

    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2657".encode('utf-8').white: @symbol= "\u2657".encode('utf-8').red
    end
end

class Queen < Game_Piece

    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2655".encode('utf-8').white: @symbol= "\u2655".encode('utf-8').red
    end
end

class King < Game_Piece

    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2654".encode('utf-8').white: @symbol= "\u2654".encode('utf-8').red
    end
end