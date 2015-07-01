require_relative 'board'
require_relative 'piece'
require_relative 'display'

class Player

  attr_accessor :display, :e
  attr_reader :board, :color, :name

  def initialize(name, color, display, board)
    @name = name
    @color = color
    @display = display
    @board = board
  end

  def ==(other_player)
    self.name == other_player.name
  end

  def take_turn
    position = display.select_square
    destination = display.select_square

    piece = board.piece_at(position)
    board.move(position, destination, color)
  end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    display = Display.new(board)
    player = Player.new("Lisa", :white, display, board)
    player.take_turn
end
