require 'byebug'
require 'colorize'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def loop_test
    i = 0
    render
    until i > 10
      @cursor.get_input
      render
      i += 1
    end
  end

  def render
    system('clear')
    @board.grid.each_with_index do |row, row_idx|
      str = ""
      row.each_with_index do |piece, col_idx|
        pos_str = piece.to_s
        pos_str = colorize_null([row_idx, col_idx]) if piece.is_a?(NullPiece)
        pos_str = pos_str.colorize(:red) if @cursor.cursor_pos == [row_idx, col_idx]
        str << " #{pos_str}"
      end
      puts str
    end
    puts "\n"
  end

  def colorize_null(pos)
    even_col = pos.last % 2 == 0
    if pos.first % 2 == 0
      even_col ? (return "◯".colorize(:yellow)) : (return "◯".colorize(:green))
    else
      even_col ? (return "◯".colorize(:green)) : (return "◯".colorize(:yellow))
    end
  end

end
