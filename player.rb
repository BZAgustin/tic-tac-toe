class Player

  attr_accessor :shape, :moves

  def initialize(shape)
    @shape = shape
    moves = []
  end

  def place(game, num)
    game.board[num] = @shape
  end
end
