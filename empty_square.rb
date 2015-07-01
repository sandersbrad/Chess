class EmptySquare

  def empty?
    true
  end

  def piece?
    false
  end

  def symbol
    " "
  end

  def dup(duped_board)
    self.class.new
  end

  def update_position(new_position)
  end

  def possible_moves
    []
  end

end
