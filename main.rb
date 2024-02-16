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

  def start_game
    puts 'Welcome to terminal tic tac toe!'
    # insert draw board module in a bit
    
    TicTacToe.drawBoard
    loop do
      puts 'Player 1 select your choice'
      guess = gets.chomp.to_i
    end
  end
end

game = TicTacToe.new
game.start_game

# select = userchoice
