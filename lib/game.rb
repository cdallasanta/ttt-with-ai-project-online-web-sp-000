class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :WIN_COMBINATIONS
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] != ' '
        return combo
      end
    end
    return false
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    board.display
    puts "#{current_player.token}, Select a square"
    input = current_player.move
    while !board.valid_move?(input)
      puts "Select a valid square"
      input = current_player.move
    end

    board.update(input, current_player)
  end

  def play
    turn
    while !over?
      turn
    end

    board.display
    if won?
      puts "Congratulations, #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
