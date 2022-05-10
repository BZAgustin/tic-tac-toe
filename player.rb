# frozen_string_literal: true

class Player
  attr_accessor :name, :shape, :moves, :turn

  def initialize(name)
    @name = name
    @shape = nil
    @moves = []
    @turn = false
  end

  def place(game, num, next_player)
    if game.board[num - 1] != '-' || ((num - 1).negative? && num - 1 > 8)
      puts 'Invalid choice'
    else
      game.board[num - 1] = @shape
      @moves.push(num)
      @turn = false
      next_player.turn = true
    end
  end
end
