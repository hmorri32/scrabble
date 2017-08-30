require_relative 'dictionary'

class Scrabble
  include Dictionary 

  attr_accessor :score
  
  def initialize 
    @score = 0
  end

  def score(word)
    return @score = 0 if word.nil? || word.empty? 
    reset_score
    plus_ten_if_over_seven(word)
    formatted = format(word)
    formatted.each {|letter| @score += point_values[letter]}
    @score 
  end

  def score_with_multipliers(word, array, multiplier = 1)
    plus_ten_if_over_seven(word)
    formatted = format(word)
    formatted.each.with_index do |letter, index|
      @score += point_values[letter] * array[index]            
    end
    @score * multiplier
  end

  def format(word)
    word.upcase.chars 
  end

  def reset_score
    @score = 0    
  end

  def seven?(word)
    word.length >= 7
  end

  def plus_ten_if_over_seven(word)
    @score += 10 if seven?(word)
  end
end
