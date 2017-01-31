require_relative 'piece'
require_relative 'sliding_piece'

class Queen < Piece
  include SlidingPiece

  def initialize(color, board, position)
    super
  end

  def to_s
    return "♕" if @color == :white
    return "♛"
  end

  def move_dirs
    return [:edge_adj, :corner_adj]
  end

end
