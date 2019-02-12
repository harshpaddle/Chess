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
        system("clear")
        (0..7).each do |row|
            puts 
            (0..7).each do |col|
                if @cursor.cursor_pos == [row, col]
                    print (@board[[row, col]].symbol.to_s.on_yellow + " ").colorize(:blue)
                else
                    if [row, col].sum.even?
                        print @board[[row, col]].symbol.to_s.on_blue + " "
                    else
                        print @board[[row, col]].symbol.to_s.on_black + " "
                    end
                    # print @board[[row, col]].symbol.to_s + "|".colorize(:red)
                end 
            end
        end
    end

end