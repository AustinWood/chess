require_relative 'piece'
require 'byebug'

class Pawn < Piece

  def initialize(color, board, position)
    super
  end

  def to_s
    return "♙" if @color == :white
    return "♟"
  end

  def moves
    return [forward_moves] #+ capture_moves
    # unit_moves
    # moves_arr = unit_moves.map { |move| [@position.first + move.first, @position.last + move.last] }
    # valid_moves = moves_arr.reject { |move| move_status(move) == :invalid }
  end

  def forward_moves
    unit_move = (@color == :white ? [1,0] : [-1,0])
    one_step = new_pos(unit_move)
    return one_step if move_status(one_step) == :valid


  end

  def capture_moves

  end

  def new_pos(unit_move)
    [@position.first + unit_move.first, @position.last + unit_move.last]
  end

  # TODO: DRY
  def move_status(new_position)
    return :invalid unless @board.in_bounds?(new_position)
    return :valid if @board[new_position].is_a?(NullPiece)
    return :capture if @board[new_position].color != self.color
    return :invalid
  end
end
