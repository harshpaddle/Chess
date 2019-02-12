require_relative "Board"
require_relative "Display"
require_relative "Piece"
require_relative "Cursor"

board = Board.new()
display = Display.new(board)

loop do
     display.render
     display.cursor.get_input
end