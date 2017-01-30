require_relative 'null_piece'

class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    add_starting_pieces
  end

  def add_starting_pieces
    arr = [0,1,6,7]
    arr.each do |row|
      @grid[row] = Array.new(8) { Piece.new }
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise StandardError.new "there is no piece at start_pos"
    elsif 0==1 #TODO the piece cannot move to end_pos
      raise StandardError.new "the piece cannot move to end_pos"
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new

  end

end
