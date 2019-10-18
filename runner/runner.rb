require './lib/computer'
require './lib/game'

@computer = Computer.new(4, {
  "(r)ed" => "R",
  "(g)reen" => "G",
  "(b)lue" => "B",
  "(y)ellow" => "Y",
})

@game = Game.new(@computer, Time.now.strftime('%H:%M'))

def start
  user_input = ""
  @game.startup
  catch :take_me_out do
    @game.get_user_guess
  end
  @game.end_game
end

loop do
  puts 'Welcome to MASTERMIND'

  puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
  print '> '
  loop do
    user_input = gets.chomp.downcase
    if user_input == 'play' || user_input == 'p'
      start
      break
    elsif user_input == 'instructions' || user_input == 'i'
      instructions
      puts 'Would you like to (p)lay?'
      print '> '
    else
      abort
    end
  end
end
