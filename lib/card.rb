class Card
  # initialize object of Card class with readable attributes of suit, value and rank
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end
