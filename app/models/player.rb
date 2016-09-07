class Player < ActiveRecord::Base
  has_and_belongs_to_many  :games
  
  enum starting_point: [:top_at_zero, :bottom_at_seven]
end
