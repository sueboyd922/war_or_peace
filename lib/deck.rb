require './lib/card'

class Deck
  attr_reader :cards
  # attr_reader :high_cards

  def initialize(cards)
    @cards = cards
    #@high_cards = []
  end

  def rank_of_card_at(x)
    # if @cards == []
    #   return 0
    # elsif @cards[2] == nil
    if @cards[x] == nil
      return 0
    else
      @cards[x].rank
    end
  end

  def high_ranking_cards
    # cards.select{|card| card.rank > 10}
    # @high_cards = []
    # cards.select{
    #   |card| if card.rank > 10
    #   high_cards << "#{card.value} of #{card.suit}"
    # end}
    # @high_cards

    cards.select {|card| card.rank > 10}



    # cards.map do |card|
    #   if card.rank > 10
    #     card
    #   end
    # end

  end

  def percent_high_ranking

    (high_ranking_cards.count.to_f / @cards.count.to_f).round(4) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
#require 'pry'; binding.pry

end
