require_relative 'board'

class Piece
  def initialize(board, pos)
    @board = board
    @pos = pos
  end

  def valid_moves(pos)
    []
  end

  def moves
  end
end

class NullPiece < Piece
end

module SlidingPiece
  def move_dirs
  end

  def moves
    results = []
    moves_dirs.each do |dir|
      potential_pos = [@pos[0] + dir[0], @pos[1] + dir[1]]
      while board.valid_pos?(potential_pos)
        results << potential_pos
        potential_pos = [potential_pos[0] + dir[0], potential_pos[1] + dir[1]]
      end
    end

    result
  end

end

module SteppingPiece
  def moves
  end
end

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    [[-1,-1], [-1,1], [1,-1], [1,1]]
  end

end

class Rook < Piece
  include SlidingPiece

  def move_dirs
    [[0,-1], [0,1], [1,0], [1,0]]
  end

end

class Queen < Piece
  include SlidingPiece
  def move_dirs
    [[-1,-1], [-1,1], [1,-1], [1,1], [0,-1], [0,1], [1,0], [1,0]]
  end

end

class Knight < Piece
  include SteppingPiece


end

class King < Piece
  include SteppingPiece

end

class Pawn < Piece

end
