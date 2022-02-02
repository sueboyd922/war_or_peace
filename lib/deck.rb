require './card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(x)
    cards[x].rank
  end
  
require 'pry'; binding.pry

end
