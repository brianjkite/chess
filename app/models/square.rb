class Square < ActiveRecord::Base
  belongs_to  :board
  has_one     :piece
  
end
