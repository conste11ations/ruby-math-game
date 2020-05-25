class Game
  attr_accessor :turn, :first_val

  def initialize()
    @turn = rand(1..2)
  end

  def question_key_generator()
    first_val = rand(10)
    second_val = rand(10)
    operator = ["+", "-", "/", "*"].sample
    answer = first_val + second_val
    
    "#{operator}"
  end

end