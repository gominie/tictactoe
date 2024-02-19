require 'pry-byebug'
# module to draw a board
class TicTacToe
  def initialize
    @@boardHash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
    @@current_player = 'X'
    @@victory = false
    @@draw = false
    @@positions_filled = 0
  end

  def self.drawBoard
    # boardHash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
    boardHash = @@boardHash
    counter = 0

    boardHash.each do |_key, value|
      print "|#{value}|"
      counter += 1
      puts if counter % 3 == 0
    end
  end

  def self.switch_player
    @@current_player = @@current_player == 'X' ? 'O' : 'X'
  end

  def self.update_board(choice)
    @@boardHash[choice] = @@current_player
  end

  def self.check_for_win
    # horizontal
    # vertical
    # diagonal
    boardHash = @@boardHash
    sets_of_keys = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    match = sets_of_keys.any? { |keys| keys.map { |key| @@boardHash[key] }.uniq.length == 1 }
    draw = boardHash.all? { |value| %w[X O].include?(value) }
    return unless match

    @@victory = true
    puts "Player #{@@current_player} you have won!"
    puts "#{@@boardHash}"
  end

  def self.no_victory
    boardHash = @@boardHash
    @@positions_filled = @@boardHash.all? { |_key, value| %w[X O].include?(value) if value.is_a?(String)}
    return unless @@positions_filled && !TicTacToe.check_for_win

    @@draw = true
    puts "draw"
  end

  def start_game
    puts 'Welcome to terminal tic tac toe!'
    loop_count = 0
    while @@victory == false && @@draw == false
      TicTacToe.drawBoard
      puts "Player #{@@current_player}, select your choice (1-9)"
      choice = gets.chomp.to_i
      if (1..9).include?(choice) && @@boardHash[choice] != 'X' && @@boardHash[choice] != '0'
        TicTacToe.update_board(choice)
        TicTacToe.switch_player
        loop_count += 1
       #if loop_count >= 9
          TicTacToe.check_for_win
          TicTacToe.no_victory
          TicTacToe.class_eval { @@boardHash }
          #binding.pry
        #end
      end
    end
  end
end

# rescue/exception code if user doesnt select 1..9

game = TicTacToe.new
game.start_game

# #no code for no victory
# #can i press same num twice?
# #open pry debug and see value of position filled incase of draw

# open irb to inspect value
