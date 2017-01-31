require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece
  
  def initialize(board, position)
    super
  end

  def to_s
    return "♗" if @color == :white
    return "♝"
  end

  def move_dirs
    return [:corner_adj]
  end

end
