require_relative 'piece'

class Board
  attr_accessor :pieces

  def initialize
    @pieces = Array.new(2) { Array.new(8) { Piece.new } }
    @pieces += Array.new(4) {Array.new(8) { nil } }
    @pieces += Array.new(2) { Array.new(8) { Piece.new } }
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at position." if self[start_pos] == nil
    raise "End position is not a valid move." unless valid_moves(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def [](pos)
    @pieces[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @pieces[pos[0]][pos[1]] = value
  end

  def valid_pos?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

end

class Piece
  def initialize
  end

  def valid_moves(pos)
    true
  end
end

class NullPiece < Piece
end
