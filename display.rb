require 'byebug'
require 'colorize'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    system('clear')
    @board.grid.each_with_index do |row, row_idx|
      str = ""
      row.each_with_index do |piece, col_idx|
        pos_str = piece.to_s
        pos_str = pos_str.colorize(:red) if @cursor.cursor_pos == [row_idx, col_idx]
        str << pos_str
      end
      puts str
    end
    puts "\n"
  end

end
