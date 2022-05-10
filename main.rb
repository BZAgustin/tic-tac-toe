# frozen_string_literal: true

require './game'
require './player'

# Create new game object
game = Game.new
player_one = Player.new('Player 1')
player_two = Player.new('Player 2')

game.start(player_one, player_two)

game.begin_turn(player_one, player_two)

game.end(player_one, player_two)
