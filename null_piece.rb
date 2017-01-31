require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :null
  end

  def to_s
    return "◯"
  end

end
