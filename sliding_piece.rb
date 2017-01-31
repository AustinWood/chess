require 'byebug'

module SlidingPiece
  CORNER_MOVES = [[1, 1], [-1, 1], [-1, -1], [1, -1]]
  EDGE_MOVES = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def moves
    unit_moves = []
    unit_moves.concat(CORNER_MOVES) if move_dirs.include?(:corner_adj)
    unit_moves.concat(EDGE_MOVES) if move_dirs.include?(:edge_adj)
    moves_arr = []
    unit_moves.each do |dir|
      cur_pos = [@position.first + dir.first, @position.last + dir.last]
      while move_status(cur_pos) == :valid
        moves_arr << cur_pos unless move_status(cur_pos) == :invalid
        cur_pos = [cur_pos.first + dir.first, cur_pos.last + dir.last]
      end
    end
    moves_arr
  end

end
