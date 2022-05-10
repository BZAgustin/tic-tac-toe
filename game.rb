# frozen_string_literal: true

class Game
  attr_accessor :winner_sets, :board

  def initialize
    @winner_sets = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7]]
    @board = Array.new(9, '-')
  end

  def display_board
    puts '-------------'
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts '-------------'
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts '-------------'
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts '-------------'
  end

  # Show game title, prompt Player 1 to pick a shape and
  # give it the first turn
  def start(p_one, p_two)
    @board = Array.new(9, '-')

    puts "----- TIC TAC TOE -----\n\n"

    pick_shape(p_one, p_two)

    p_one.turn = true
  end

  def pick_shape(p_one, p_two)
    puts 'Pick your shape (X or O):'

    # Get input
    player_choice = gets.chomp

    # Validate input
    while player_choice.downcase != 'x' && player_choice.downcase != 'o'
      puts 'Invalid choice. Try again'
      player_choice = gets.chomp.upcase
    end

    # Assign chosen shape to player
    p_one.shape = player_choice.upcase
    p_two.shape = p_one.shape == 'X' ? 'O' : 'X'
  end

  def begin_turn(p_one, p_two)
    # Run until every space on the board is taken
    while board.any?('-')
      display_board
      if p_one.turn
        puts 'Player One\'s Turn (Use 1 to 9):'
        choice = gets.chomp.to_i
        p_one.place(self, choice, p_two)
      else
        puts 'Player Two\'s Turn (Use 1 to 9):'
        choice = gets.chomp.to_i
        p_two.place(self, choice, p_one)
      end
      break unless check_winner(p_one, p_two).nil?
    end
  end

  def check_winner(p_one, p_two)
    # Look at the winner combinations and see if they match with any player's
    # moves (also check that player has made at least 3 moves)
    winner_sets.each do |set|
      next unless (p_one.moves.length > 2 && (set & p_one.moves.sort) == set) ||
                  (p_two.moves.length > 2 && (set & p_two.moves.sort) == set)

      return p_one if p_one.moves.length > 2 && (set & p_one.moves.sort) == set

      return p_two if p_two.moves.length > 2 && (set & p_two.moves.sort) == set
    end
    nil
  end

  def end(p_one, p_two)
    display_board

    if check_winner(p_one, p_two) == p_one
      puts "#{p_one.name} Wins!"
    elsif check_winner(p_one, p_two) == p_two
      puts "#{p_two.name} Wins!"
    else
      puts 'It\'s a tie!'
    end
  end
end
