class Piece

  attr_reader :position

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def to_s
    return "♙" if @color == :white
    return "♟"
  end

  def empty?

  end

  def symbol

  end

  def moves

  end

  def move_staus(new_position)
    return :invalid unless @board.in_bounds?(new_position)
    return :valid if @board[new_position].is_a?(NullPiece)
    return :capture if @board[new_position].color != self.color
    return :invalid
  end

  private

  def move_into_check(to_pos)

  end

end
