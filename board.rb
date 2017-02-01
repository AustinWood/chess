require_relative 'pieces'
require_relative 'display'
require 'byebug'

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
        @grid[i] = add_other_pieces(:white, i)
      when 1
        @grid[i] = add_pawns(:white, i)
      when 6
        @grid[i] = add_pawns(:black, i)
      when 7
        @grid[i] = add_other_pieces(:black, i)
      end
    end
    nil
  end

  def add_pawns(color, i)
    row = []
    (0..7).each do |j|
      row << Pawn.new(color, self, [i, j])
    end
    row
  end

  def add_other_pieces(color, i)
    row = []
    (0..7).each do |j|
      case j
      when 0, 7
        #debugger
        row << Rook.new(color, self, [i, j])
      when 1, 6
        row << Knight.new(color, self, [i, j])
      when 2, 5
        row << Bishop.new(color, self, [i, j])
      when 3
        row << Queen.new(color, self, [i, j])
      when 4
        row << King.new(color, self, [i, j])
      end
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
    piece = self[start_pos]
    if piece.is_a?(NullPiece)
      raise StandardError.new "there is no piece at start_pos"
    end
    valid_moves = piece.moves
    unless valid_moves.include?(end_pos)
      raise StandardError.new "the piece cannot move to end_pos"
    end
    self[end_pos] = piece
    piece.position = end_pos
    self[start_pos] = NullPiece.instance
  end

  def in_bounds?(pos)
    pos.all? { |x| x >= 0 && x < 8 }
  end

  def in_check?(color)
    king_loc = find_king(color)
    flat_grid = @grid.flatten
    flat_grid.each do |piece|
      if !piece.is_a?(NullPiece) && piece.color != color
        return true if piece.moves.include?(king_loc)
      end
    end
    false
  end

  def find_king(color)
    flat_grid = @grid.flatten
    flat_grid.each do |piece|
      return piece.position if piece.is_a?(King) && piece.color == color
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.render
  board.move_piece([6,4],[5,4])
  board.move_piece([7,3],[3,7])
  board.move_piece([1,5],[2,5])
  #board.move_piece([3,7],[0,4])
  display.render
  p board.in_check?(:white)



end
