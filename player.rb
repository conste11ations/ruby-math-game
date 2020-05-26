class Player
  attr_reader :name

  MAX_LIVES = 3

  def initialize(name)
    @name = name
    @lives = MAX_LIVES
  end

  def dead?
      @lives <= 0
  end

  def status
    "#{name} : #{@lives}/#{MAX_LIVES}".sub! "Player ", "P" 
  end

  def loses_lives(decrementor)
    @lives -= decrementor
  end

end