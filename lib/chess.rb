require './pieces'
require './coordinate'
require './piece'
require './board'
require './exceptions'

game = Board.new(Pieces::INITIAL_SEED)

puts "\n\n\n\n################### CHESS SIMULATOR ###################\n"
puts "- Board dimensions are 8x8 starting from (0,0) to (7,7)"
puts "- Initial state of the game is same as a new chess game"
puts "- To move a piece from one position to another, enter the command \"<from-x-coordinate>,<from-y-coordinate>:<to-x-coordinate>,<to-y-coordinate>\" without the quotes"
puts "- Eg."
puts "\t3,4:5,6"
puts "- Entering the aforesaid command will move the piece at position (3, 4) to position (5, 6)"
puts "- To visualize the state of the board"
game.print_state
is_white_turn = true
continue_game = 'y'

def play_game(game, is_white_turn)
  turn = is_white_turn ? Piece::Set::WHITE : Piece::Set::BLACK
  puts "#{turn.to_s.capitalize}'s Turn! Enter the command to move a #{turn} piece:"
  command = gets.chomp.split(":")
  from_str = command[0].split(",")
  to_str = command[1].split(",")
  from = Coordinate.new(from_str[0].to_i, from_str[1].to_i)
  to = Coordinate.new(to_str[0].to_i, to_str[1].to_i)
  unless (game.is_piece_white_at?(from) && is_white_turn) || (!game.is_piece_white_at?(from) && !is_white_turn)
    raise(Exceptions::NotYourTurnException)
  end
  game.make_move(from, to)
  game.print_state
end

while continue_game == 'y'
  play_game(game, is_white_turn)
  is_white_turn = !is_white_turn
  puts "Enter y to continue:\n"
  continue_game = gets.chomp
end
