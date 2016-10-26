class ChessBoard
    attr_reader :squares
    
    def initialize
        build_board(8,8)
    end
    
    def build_board(cols, rows)
        @squares = Array.new
        cols.times do |column|
            rows.times do |row|
                @squares << [column,row]
            end
        end
    end
end
