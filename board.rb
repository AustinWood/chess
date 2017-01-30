require_relative 'null_piece'

class Board

  def initialize
    @grid = new_board
  end

  def new_board
    Array.new(8) { Array.new(8) { NullPiece.new } }
  end


end
