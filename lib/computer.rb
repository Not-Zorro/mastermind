class Computer
  attr_reader :colors,
              :number,
              :selection,
              :guess_count

  def initialize(number, colors)
    @number = number
    @colors = colors
    @selection = Array.new
    @guess_count = 0
    random_selection
  end

  def random_selection
    @number.times do
      @selection << @colors.values.sample
    end
  end

  def element_correct(user_input)
    new_input = user_input.upcase.split(//)
    uniq_selection = @selection.uniq
    new_input.count do |element|
      uniq_selection.include?(element)
    end
  end

  def new_guess
    @guess_count += 1
  end

  def actual
    @selection.join.upcase
  end

  def user_comparison(user_input)
    new_input = user_input.upcase.split(//)
    @selection.zip(new_input).count do |comparison|
      comparison[0] == comparison[1]
    end
  end
end
