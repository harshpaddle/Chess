require_relative "cursor.rb"
require "colorize"
require 'colorized_string'
require_relative "Board.rb"
require "byebug"

class Display
    attr_reader :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render
        cursor.get_input
        (0..7).each do |row|
            row_str = "|"
            (0..7).each do |col|
                piece = @board[[row, col]]

                if piece.nil?
                    row_str += "_|"
                else
                    row_str += piece.symbol + "|" 
                end
                if piece == cursor
                    row_str.colorize(:light_blue)
                end
            end
            puts row_str
        end
    end

end