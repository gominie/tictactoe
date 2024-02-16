# boardHash = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
# counter = 0
# boardHash.each do |key, value|
#   print "|#{value}|"
#   counter += 1
#  puts if counter % 3 == 0 || counter == boardHash.size
# end

# module to draw a board
class TicTacToe
  def initialize
    @@boardHash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
    @@current_player = "X"
   end

  def self.drawBoard
    #boardHash = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
    boardHash = @@boardHash
    counter = 0

    boardHash.each do |key, value|
      print "|#{value}|"
      counter += 1
      puts if counter % 3 == 0
    end
  end

  def self.switch_player
    @@current_player = (@@current_player = "X") ? "O" : "X"
end

  def self.update_board(choice)
    @@boardHash[choice] = @@current_player
  end

  def start_game
    puts 'Welcome to terminal tic tac toe!'
    # insert draw board module in a bit
    loop do

    TicTacToe.drawBoard
      puts "Player #{@@current_player}, select your choice (1-9)"
      choice = gets.chomp.to_i
      if (1..9).include?(choice) && @@boardHash[choice]!= "X" && @@boardHash[choice] != "0"
         TicTacToe.update_board(choice)
         TicTacToe.switch_player
       end
    end
  end
end

#rescue/exception code if user doesnt select 1..9

game = TicTacToe.new
game.start_game

# select = userchoice
