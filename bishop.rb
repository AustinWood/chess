require_relative 'piece'

class Bishop < Piece

  def initialize(board, position)
    super
  end

  def to_s
    return "♗"
  end

  def move_dirs
    return [:corner_adj]
  end

end
