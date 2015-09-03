module SlidingPiece

  def moves_from_vector(vector)
    vector_moves = []

    i = 1
    loop do
      new_vector = vector.map {|x| x*i }
      move = step(new_vector)
      i += 1
      break if !board.in_bounds?(move)
      vector_moves << move
      break if board.piece_at(move).piece?
    end

    vector_moves
  end

end
