class Player
    attr_reader :name, :color
    def initialize(color)
        @name = name
        (color == "white")? @color = :white: @color = :black
    end
    
    def choose_piece(board)
       puts "Choose a piece like this '1,1'!"
       position = gets.chomp.split(",").map{|x|x.to_i}
       puts position.inspect
    end
end