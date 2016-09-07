class Board < ActiveRecord::Base
  has_many :pieces
  has_many :squares
  belongs_to :game
  
  def initialize_players
    player_ids = game.players.collect(&:id)
    initialize_player(player_ids[0], 0)
    initialize_player(player_ids[1], 7)
  end
  
  def initialize_player(player_id, starting_column)
    set_square(0, starting_column, Rook.create(board_id: id, player_id: player_id))
    set_square(7, starting_column, Rook.create(board_id: id, player_id: player_id))
    set_square(1, starting_column, Knight.create(board_id: id, player_id: player_id))
    set_square(6, starting_column, Knight.create(board_id: id, player_id: player_id))
    set_square(2, starting_column, Bishop.create(board_id: id, player_id: player_id))
    set_square(5, starting_column, Bishop.create(board_id: id, player_id: player_id))
    set_square(3, starting_column, Queen.create(board_id: id, player_id: player_id))
    set_square(4, starting_column, King.create(board_id: id, player_id: player_id))
    8.times do |i|
      set_square(i, starting_column == 0 ? 1 : 6, Pawn.create(board_id: id, player_id: player_id))
    end
  end
  
  def set_square(x, y, piece)
    squares.where(x: x, y: y).first.try(:update_column, :piece_id, piece.id)
  end
  
end
