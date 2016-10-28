class Player
    attr_reader :name, :color
    def initialize(color)
        @name = name
        (color == "white")? @color = :white: @color = :black
    end
    
    def choose_square
        puts "Choose a piece like this '1,1'!"
        position = gets.chomp.split(",").map{|x|x.to_i}
    end
    
    def check_color(piece)
        if piece.nil?
            puts "nil!"
            same_color = false
        else
            puts piece.color
            (piece.color == @color.to_s)? same_color = true: same_color = false
        end
        same_color
    end 
end
