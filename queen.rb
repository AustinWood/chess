require_relative 'piece'

class Queen < Piece

  def initialize(board, position)
    super
  end

  def to_s
    return "♕"
  end

  def move_dirs
    return [:edge_adj, :corner_adj]
  end

end
