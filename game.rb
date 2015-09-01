require_relative 'board'
require_relative 'display'
require_relative 'player'
require_relative 'computer_player'

class Game
  attr_accessor :current_player
  attr_reader :player1, :player2, :board, :display

  def initialize
    @board = Board.new
    @display = Display.new(board, self)
    @player1 = Player.new("Lisa", :white, display, board)
    @player2 = ComputerPlayer.new("Brad", :black, display, board)
    @current_player = player2
  end

  def play
    until board.checkmate?(current_player.color)
      display.render
      puts "#{current_player.name}'s turn.'"
      begin
        current_player.take_turn
      rescue InvalidMove => e
        display.error_message = e.message
        retry
      rescue NotYourPiece => e
        display.error_message = e.message
        retry
      end
      display.error_message = nil
      switch_players
    end

    display.render
    puts "Checkmate!"
  end

  def switch_players
    self.current_player = (current_player == player1) ? player2 : player1
  end

end

game = Game.new
game.play
