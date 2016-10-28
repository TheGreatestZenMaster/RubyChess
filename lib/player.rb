class Player
    attr_reader :name, :color
    def initialize(color)
        @name = name
        (color == "white")? @color = :white: @color = :black
    end
    
    def check_color(piece)
        same_color = false
        piece.nil?? (puts "There's no piece there!"): (piece.color == @color.to_s)? same_color = true: (puts "That's not your piece!")
        same_color
    end 
end
