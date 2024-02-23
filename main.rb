class TicTacToe
  def initialize
    @@boardHash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
    @@current_player = 'X'
    @@victory = false
    @@draw = false
    @@choice = 0
  end

  def self.drawBoard
    boardHash = @@boardHash
    counter = 0

    boardHash.each do |_key, value|
      print "|#{value}|"
      counter += 1
      puts if counter % 3 == 0
    end
  end

  def self.switch_player
    if !@@victory && !@@draw
     @@current_player = @@current_player == 'X' ? 'O' : 'X'
      puts "Current player: #{@@current_player}"
    end
  end

  def self.update_board(choice)
    @@boardHash[choice] = @@current_player
  end

  def self.check_for_win
    sets_of_keys = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    match = sets_of_keys.any? { |keys| keys.map { |key| @@boardHash[key] }.uniq.length == 1 }
    return unless match
    @@victory = true
    puts "Player #{@@current_player} you have won!"
  end

  def self.no_victory
    positions_filled = @@boardHash.all? { |_key, value| %w[X O].include?(value) }
    return unless positions_filled && !@@victory
     @@draw = true
     puts 'draw'
    #end
  end

  def start_game
    puts 'Welcome to terminal tic tac toe!'
    TicTacToe.drawBoard
    loop_count = 0
    while @@victory == false && @@draw == false
      puts "Player #{@@current_player}, select your choice (1-9)"
      @@choice = gets.chomp.to_i
      next unless (1..9).include?(@@choice) && @@boardHash[@@choice] != 'X' && @@boardHash[@@choice] != '0'
      TicTacToe.update_board(@@choice)
      TicTacToe.check_for_win
      TicTacToe.no_victory
      loop_count += 1
       TicTacToe.drawBoard
        TicTacToe.switch_player
      break if @@victory || @@draw
    end
  end
end



game = TicTacToe.new
game.start_game
