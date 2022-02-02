require './card'

class Deck
  attr_reader :cards
  attr_reader :high_cards

  def initialize(cards)
    @cards = cards
    @high_cards = []
  end

  def rank_of_card_at(x)
    cards[x].rank
  end

  def high_ranking_cards
    # cards.select{|card| card.rank > 10}
    # @high_cards = []
    # cards.select{
    #   |card| if card.rank > 10
    #   high_cards << "#{card.value} of #{card.suit}"
    # end}
    # @high_cards

    @high_cards = cards.select {|card| card.rank > 10}
    @high_cards


    # cards.map do |card|
    #   if card.rank > 10
    #     card
    #   end
    # end

  end

  def percent_high_ranking
    (@high_cards.count.to_f / @cards.count.to_f).ceil(4) * 100
  end

require 'pry'; binding.pry

end
