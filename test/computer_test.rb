require 'minitest/autorun'
require './lib/computer'
require 'pry'
require 'mocha/minitest'

class ComputerTest < Minitest::Test
  def setup
    @colors_hash = {
      "(r)ed" => "R",
      "(g)reen" => "G",
      "(b)lue" => "B",
      "(y)ellow" => "Y",
    }
    @number = 4
    @computer = Computer.new(@number, @colors_hash)
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_initialize
    assert_equal @colors_hash, @computer.colors
    assert_equal @number, @computer.selection.length
    assert_equal @number, @computer.colors.length
    assert_equal @number, @computer.number
  end

  def test_random_selection
    assert_equal 4, @computer.random_selection
  end
end
