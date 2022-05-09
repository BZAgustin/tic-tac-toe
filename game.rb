class Game

  @@WINNER_COMB = [[1, 2, 3], [4, 5, 6], [7, 8, 9], 
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]
  
  attr_accessor :board

  def initialize()
    @board = Array.new(9)
  end

  def display_board()
    puts @board
  end
end

game = Game.new()

game.display_board