gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup 
    @scrabble = Scrabble.new
  end
  
  def test_it_can_score_nil_and_empty
    assert_equal 0, @scrabble.score("")
    assert_equal 0, @scrabble.score(nil)
  end

  def test_it_can_score_single_letters 
    assert_equal 1, @scrabble.score("a")
    assert_equal 4, @scrabble.score("f")
  end

  def test_it_can_score_word 
    assert_equal 8, @scrabble.score('hello')
  end

  def test_seven_or_more_characters
    assert_equal 44, @scrabble.score('jacuzzi')
  end
  
  def test_seven_method 
    assert @scrabble.seven?('1234567')
    refute @scrabble.seven?('123456')
  end

  def test_format 
    assert_equal ['S', 'U', 'H'], @scrabble.format('suh')
  end

  def test_multiplier_by_1
    assert_equal 9, @scrabble.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_multiplier_by_2 
    assert_equal 18, @scrabble.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_multiplier_and_seven 
    assert_equal 58, @scrabble.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end
end
