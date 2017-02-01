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
    forward_moves + capture_moves
  end

  def forward_moves
    unit_move = (@color == :white ? [1,0] : [-1,0])
    one_step = new_pos(unit_move)
    forward_arr = []
    if move_status(one_step) == :valid
      forward_arr << one_step
      if @position.first == (@color == :white ? 1 : 6)
        unit_move = (@color == :white ? [2,0] : [-2,0])

        two_step = new_pos(unit_move)
        forward_arr << two_step if move_status(two_step) == :valid
      end
    end
    forward_arr
  end

  def capture_moves
    capture_arr = []

    unit_moves = (@color == :white ? [[1,-1], [1,1]] : [[-1,-1], [-1,1]])

    unit_moves.each do |move|
      capture_pos = new_pos(move)
      capture_arr << capture_pos if move_status(capture_pos) == :capture
    end


    capture_arr

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
