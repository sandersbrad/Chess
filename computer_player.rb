class ComputerPlayer
  def initialize(name, color, display, board)
    @name = name
    @color = color
    @display = display
    @board = board
  end

  def pieces
    @board.find_pieces(color)
  end

  def take_piece_options
    moves = []
    pieces.each do |piece|
      piece.possible_moves.each do |move|
        if @board.piece_at(move).piece?
          moves << move
        end
      end
    end
  end

  def check_options
    moves = []
    pieces.each do |piece|
      piece.possible_moves.each do |move|
        ##
  end


end
