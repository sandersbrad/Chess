class Pawn < Piece
  def initialize(position, color, board)
    @value = 1
    if color == :black
      @vectors = [[-1, 0]]
      @diags = [[-1, -1], [-1, 1]]
    else
      @vectors = [[1, 0]]
      @diags = [[1, 1], [1, -1]]
    end
    super(position, color, board)
  end

  def moves_from_vector(vector)
    vector_moves = []
    if !moved
      i = 1
      while i < 3
        new_vector = vector.map {|x| x*i }
        move = step(new_vector)
        vector_moves << move
        i += 1
      end
    end

    @diags.each do |diag_vector|
      x, y = position
      dx, dy = diag_vector
      new_position = [x + dx, y + dy]
      if board.in_bounds?(new_position) && board.occupied?(new_position) && board.piece_at(new_position).color != color
        vector_moves << step(diag_vector)
      end
    end

    x, y = position
    dx, dy = vector
    new_position = [x + dx, y + dy]
    if board.in_bounds?(new_position) && !board.occupied?(new_position)
      vector_moves << step(vector)
    end

    vector_moves
  end

  def symbol
    color == :black ? "\u265F" : "\u2659"
  end

end
