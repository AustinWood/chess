require_relative 'pieces'
require_relative 'display'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    add_starting_pieces
  end

  def add_starting_pieces
    @grid.each_with_index do |el, i|
      case i
      when 0
        @grid[i] = add_other_pieces(:white)
      when 1
        @grid[i] = add_pawns(:white)
      when 6
        @grid[i] = add_pawns(:black)
      when 7
        @grid[i] = add_other_pieces(:black)
      end
    end
    nil
  end

  def add_pawns(color)
    row = []
    (0..7).each do |idx|
      row << Piece.new(color, self, [row,idx])
    end
    row
  end

  def add_other_pieces(color)
    row = []
    (0..7).each do |idx|
      row << Queen.new(color, self, [row,idx])
    end
    row
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

  def in_bounds?(pos)
    pos.all? { |x| x >= 0 && x < 8 }
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.loop_test
end
