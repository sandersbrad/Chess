require_relative 'board'
require_relative 'piece'
require_relative 'display'

class Player

  attr_accessor :display
  attr_reader :board

  def initialize(name, color, display, board)
    @name = name
    @color = color
    @display = display
    @board = board
  end

  def take_turn
    5.times do
    position = display.select_square
    destination = display.select_square

    piece = board.piece_at(position)
    piece.move_to(destination)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    display = Display.new(board)
    player = Player.new("Lisa", :white, display, board)
    player.take_turn
end
