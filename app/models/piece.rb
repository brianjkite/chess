class Piece < ActiveRecord::Base
  belongs_to :board
  belongs_to :player
  
  #enum PieceType [:rook, :pawn, :queen, :king, :bishop]
  
  def move
    
  end
end
