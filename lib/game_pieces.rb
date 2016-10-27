class Game_Piece
    attr_reader :location, :color
    def initialize(location, color)
        @location = location
        color == "white"? @color = color: @color = "black"
    end
end

class Pawn < Game_Piece
    attr_reader :location, :color, :symbol
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2659".encode('utf-8').white: @symbol= "\u2659".encode('utf-8').red
    end
end

class Rook < Game_Piece
    attr_reader :location, :color, :symbol
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2656".encode('utf-8').white: @symbol= "\u2656".encode('utf-8').red
    end
end

class Knight < Game_Piece
    attr_reader :location, :color, :symbol
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u265B".encode('utf-8').white: @symbol= "\u265B".encode('utf-8').red
    end
end

class Bishop < Game_Piece
    attr_reader :location, :color, :symbol
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2657".encode('utf-8').white: @symbol= "\u2657".encode('utf-8').red
    end
end

class Queen < Game_Piece
    attr_reader :location, :color, :symbol
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2655".encode('utf-8').white: @symbol= "\u2655".encode('utf-8').red
    end
end

class King < Game_Piece
    attr_reader :location, :color, :symbol
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2654".encode('utf-8').white: @symbol= "\u2654".encode('utf-8').red
    end
end