require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  def initialize(color, board, position)
    super
  end

  def to_s
    return "♘" if @color == :white
    return "♞"
  end

end
