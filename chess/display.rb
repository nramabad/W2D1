require "colorize"
require_relative "cursor"
require_relative "board"

class Display

  attr_reader :cursor 

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.pieces.each_with_index do |row, i|
      row.each_with_index do |col, j|
        print ([i, j] == @cursor.cursor_pos) ? "col | ".colorize(:blue) : "col | "
      end
      puts
    end

    nil
  end





end
