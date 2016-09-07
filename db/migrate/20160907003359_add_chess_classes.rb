class AddChessClasses < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :game_id
    end
        
    create_table :games do |t|
      
      t.timestamps
    end
    
    create_table :squares do |t|
      t.integer   :board_id
      t.integer   :x
      t.integer   :y
      t.integer   :piece_id
    end
    
    create_table :pieces do |t|
      t.string    :type
      t.integer   :board_id
      t.integer   :player_id
    end
        
    create_table :players do |t|
      t.integer    :starting_point
    end
    
    create_join_table :games, :players do |t|
      t.index [:game_id, :player_id]
      t.index [:player_id, :game_id]
    end
  end
end
