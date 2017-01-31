require 'byebug'

module SteppingPiece
  KING_MOVES = [
    [1, 1], [-1, 1], [-1, -1], [1, -1],
    [1, 0], [0, 1], [-1, 0], [0, -1]
  ]
  KNIGHT_MOVES = [
    [-2, -1], [-2,  1], [-1, -2], [-1,  2],
    [ 1, -2], [ 1,  2], [ 2, -1], [ 2,  1]
  ]


  def moves
    unit_moves = (self.is_a?(King) ? KING_MOVES : KNIGHT_MOVES )
    moves_arr = unit_moves.map { |move| [@position.first + move.first, @position.last + move.last] }
    valid_moves = moves_arr.reject { |move| move_status(move) == :invalid }
  end


end
