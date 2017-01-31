require_relative 'piece'

class Rook < Piece

  def initialize(board, position)
    super
  end

  def to_s
    return "♖"
  end

  def move_dirs
    return [:edge_adj]
  end

end
