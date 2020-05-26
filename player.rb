class Player
  attr_reader :name
  attr_accessor :lives

  MAX_LIVES = 3

  def initialize(name)
    @name = name
    @lives = 3
  end

  def dead?
      @lives <= 0
  end

  def status
    "#{name} : #{lives}/#{MAX_LIVES}".sub! "Player ", "P" 
  end

  def update_lives(incrementor)
    @lives += incrementor
  end

end