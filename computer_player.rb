class ComputerPlayer
  COLORS = [:white, :black]

  attr_accessor :display, :e
  attr_reader :board, :color, :name

  def initialize(name, color, display, board)
    @name = name
    @color = color
    @display = display
    @board = board
    @opponent = COLORS.select{|col| col != @color}[0]
  end

  def take_turn
    if check_mate_options.length > 0
      move = check_mate_options[0]
    elsif check_options.length > 0
      move = check_options[0]
    elsif take_piece_options.length > 0
      move = take_piece_options[0]
    else
      move = all_possible_moves.sample
    end

    @board.move(move[0], move[1], color)
  end

  def pieces
    @board.find_pieces(color)
  end

  def all_possible_moves
    moves = []
    pieces.each do |piece|
      piece.possible_moves.each do |move|
        moves << [piece.position, move]
      end
    end
    moves
  end

  def take_piece_options
    moves = []
    pieces.each do |piece|
      piece.possible_moves.each do |move|
        if @board.piece_at(move).piece?
          moves << [piece.position, move]
        end
      end
    end
    moves
  end

  def check_options
    moves = []
    pieces.each do |piece|
      position = piece.position
      piece.possible_moves.each do |move|
        duped = @board.duped_board
        new_position = move
        duped.move_piece!(position, new_position)
        if @board.in_check?(@opponent)
          moves << [position, move]
        end
      end
    end
    moves
  end

  def check_mate_options
    moves = []
    pieces.each do |piece|
      position = piece.position
      piece.possible_moves.each do |move|
        duped = @board.duped_board
        new_position = move
        duped.move_piece!(position, new_position)
        if @board.checkmate?(@opponent)
          moves << [piece.position, move]
        end
      end
    end
    moves
  end



end
