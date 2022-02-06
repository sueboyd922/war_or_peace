require './lib/card'

class Deck
  #initialize object of Deck class with a readable attribute of cards (an array)
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end
  #method to determine what the rank of a specific card is
  def rank_of_card_at(index)
    # provision for situation when war is called but there is no third card in a players deck... rank becomes zero and they lose
    if @cards[index] == nil
      return 0
    else
      @cards[index].rank
    end
  end

  # method to find out which cards have a rank over 10
  def high_ranking_cards
    cards.select {|card| card.rank > 10}
  end

  # method to determine the percentage of high ranking cards in a deck
  def percent_high_ranking
    (high_ranking_cards.count.to_f / @cards.count.to_f).round(4) * 100
  end

  # method to remove the first (top) card of a deck
  def remove_card
    @cards.shift
  end

  # method to add a card to the back (bottom) of a deck
  def add_card(card)
    @cards.push(card)
  end
end
