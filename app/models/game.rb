class Game < ActiveRecord::Base
  has_and_belongs_to_many  :players
  has_one   :board
  has_many :pieces, through: :board
  
  def self.set_up_new_game
    game = Game.create
    game.players.create(starting_point: 0)
    game.players.create(starting_point: 1)
    game.save
    board = Board.create(game_id: game.id)
    64.times do |i|
      board.squares.create(x: i%8, y: i/8)
    end
    board.initialize_players
    game
  end
  
end
