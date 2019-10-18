class Game

  def initialize(computer, time)
    @computer = computer
    @time = time
  end

  def instructions
    puts "The object of MASTERMIND is to guess a secret code consisting of a series of 4 colors. Each guest results in feedback narrowing down the possibilities of the code. The winner is the player who solves his opponent's secret code with fewer guesses."
  end

  def startup
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    print "> "
  end

  def cheat
    puts @computer.actual
  end

  def get_user_guess
    loop do
      user_input = gets.chomp.upcase
      if user_input.length > @computer.number
        puts "Guess is too long try again."
      elsif user_input.length > @computer.number
        puts "Guess is too short try again."
      elsif user_input == 'C'
        cheat
      elsif user_input == 'QUIT' || user_input == 'Q'
        abort
      else
        throw :take_me_out if @computer.user_comparison(user_input) == @computer.number
        feedback(user_input)
      end
    end
  end

  def feedback(input)
    @computer.new_guess
    puts "'#{input}' has #{@computer.element_correct(input)} of the correct elements with #{@computer.user_comparison(input)} in the correct positions
    You've taken #{@computer.guess_count} guess(es)"
    print '> '
    get_user_guess
  end

  def end_game
    puts "Congratulations! You guessed the sequence '#{@computer.actual}' in #{@computer.guess_count} guesses over #{@time}."
  end
end
