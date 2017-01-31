module SlidingPiece
  CORNER_MOVES = [[1, 1], [-1, 1], [-1, -1], [1, -1]]
  EDGE_MOVES = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def moves
    unit_moves = []
    unit_moves.concat(CORNER_MOVES) if move_dirs.include?(:edge_adj)
    unit_moves.concat(EDGE_MOVES) if move_dirs.include?(:corner_adj)
    move_arr = []
    unit_moves.each do |dir|

    end
    move_arr
  end

end
