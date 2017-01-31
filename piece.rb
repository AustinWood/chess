class Piece

  attr_reader :position

  def initialize(board, position)
    @board = board
    @position = position
  end

  def to_s
    return "O"
  end

  def empty?

  end

  def symbol

  end

  def moves

  end

  private

  def move_into_check(to_pos)

  end

end
