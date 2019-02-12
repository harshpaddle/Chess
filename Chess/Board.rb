require_relative "Piece"

class Board
    def initialize
        @grid = Array.new(8) { Array.new(8) { nil }}
        @grid[0][2] = Piece.new 
        


    end

    def valid_end?(pos)
        x, y = pos
        x.between?(0, 7) && y.between?(0, 7)
    end 

    def move_piece(start_pos, end_pos)
        
        if !self[start_pos].is_a?(Piece)
            raise "no piece here"
        end

        piece_to_move = self[start_pos]
        self[end_pos] = piece_to_move
        self[start_pos] = nil
        #should update the 2d gird and raise an exception is there is no piece at start_pos or the
        #piece can't move to end_pos
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val

    end
end

