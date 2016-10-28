class Game_Piece
    attr_accessor :location, :color, :symbol
    
    def initialize(location, color)
        @location = location
        color == "white"? @color = color: @color = "black"
    end
end

class Pawn < Game_Piece
    attr_accessor :moves
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2659".encode('utf-8').white: @symbol= "\u2659".encode('utf-8').red
    end
    
    def valid_moves(board, position)
        @moves = Array.new
        valid_move = false
        if @color == "white"
            if @location[1] == 2
                (1..2).each do |x|
                    break unless board.squares[[@location[0],@location[1]+x]].nil?
                    @moves << [@location[0] ,@location[1]+x]
                end
            else 
                @moves << [@location[0] ,@location[1]+1] if board.squares[position].nil?
            end
        else
            if @location[1] == 7
                (1..2).each do |x|
                    break unless board.squares[[@location[0],@location[1]-x]].nil?
                    @moves << [@location[0] ,@location[1]-x]
                end
            else 
               @moves << [@location[0] ,@location[1]+1] if board.squares[[@location[0] ,@location[1]+1]].nil?
            end
        end
        puts @moves.inspect
        @moves.include?(position)? valid_move = true: (puts "That's not a valid move for that piece!")
        valid_move
    end
end

class Rook < Game_Piece
    attr_accessor :moves
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2656".encode('utf-8').white: @symbol= "\u2656".encode('utf-8').red
    end
    
    def valid_moves(board, position)
        @moves = Array.new
        valid_move = false
        verticle_move(board, position)
        diag_right(board, position)
        puts @moves.inspect
        moves.include?(position)? valid_move = true: (puts "That's not a valid move for that piece!")
        valid_move
    end
    
    def verticle_move(board, position)
        if @location[1] == 8
            (@location[1]-1).downto(1).each do |x|
                break unless board.squares[[@location[0],x]].nil?
                moves << [@location[0] ,x]
            end
        elsif @location[1] == 1
            ((@location[1]+1)..8).each do |x|
                break unless board.squares[[@location[0],x]].nil?
                moves << [@location[0] , x]
            end
        else
            (@location[1]-1).downto(1).each do |x|
                break unless board.squares[[@location[0],x]].nil?
                moves << [@location[0] ,x]
            end
            ((@location[1]+1)..8).each do |x|
                break unless board.squares[[@location[0],x]].nil?
                moves << [@location[0] , x]
            end
        end
    end
    
    def diag_right(board, position)
        if @location[0] == 8
            (@location[0]-1).downto(1).each do |x|
                break unless board.squares[[x, @location[1]]].nil?
                moves << [x, @location[1]]
            end
        elsif @location[0] == 1
            ((@location[0]+1)..8).each do |x|
                break unless board.squares[[x, @location[1]]].nil?
                moves << [x, @location[1]]
            end
        else
            (@location[0]-1).downto(1).each do |x|
                break unless board.squares[[x, @location[1]]].nil?
                moves << [x, @location[1]]
            end
            ((@location[0]+1)..8).each do |x|
                break unless board.squares[[x, @location[1]]].nil?
                moves << [x, @location[1]]
            end
        end
        
    end
end

class Knight < Game_Piece
    attr_accessor :moves
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u265B".encode('utf-8').white: @symbol= "\u265B".encode('utf-8').red
    end
end

class Bishop < Game_Piece
    attr_accessor :moves
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2657".encode('utf-8').white: @symbol= "\u2657".encode('utf-8').red
    end
    
    def valid_moves(board, position)
        @moves = Array.new
        valid_move = false
        diag_left(board, position)
        diag_right(board, position)
        puts @moves.inspect
        @moves.include?(position)? valid_move = true: (puts "That's not a valid move for that piece!")
        valid_move
    end
    
    def diag_left(board, position)
        x = @location[0]
        y = @location[1]
        (1...8).each do |change|
            break if x-change < 1 ||  y+change > 8
            break unless board.squares[[x-change,y+change]].nil?
            @moves << [x-change,y+change]
        end
        (1...8).each do |change|
            break if x+change > 8 || y-change < 1
            break unless board.squares[[x+change,y-change]].nil?
            @moves << [x+change,y-change]
        end
    end
    
    def diag_right(board, position)
        x = @location[0]
        y = @location[1]
        (1...8).each do |change|
            break if x-change < 1 ||  y-change < 1
            break unless board.squares[[x-change,y-change]].nil?
            @moves << [x-change,y-change]
            
        end
        (1...8).each do |change|
            break if x+change > 8 ||  y+change > 8
            break unless board.squares[[x+change,y+change]].nil?
            @moves << [x+change,y+change]
        end
    end
    
end

class Queen < Game_Piece
    attr_accessor :moves
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2655".encode('utf-8').white: @symbol= "\u2655".encode('utf-8').red
    end
end

class King < Game_Piece
    attr_accessor :moves
    def initialize(location, color)
        super(location, color)
        @color == "white"? @symbol= "\u2654".encode('utf-8').white: @symbol= "\u2654".encode('utf-8').red
    end
end