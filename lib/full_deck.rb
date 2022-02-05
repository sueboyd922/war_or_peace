require "./lib/card"
require "./lib/deck"


@suits = [:diamonds, :hearts, :spades, :clubs]
@full_deck = []
@deck1 = []
@deck2 = []
ranks_values = {:values => ['two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'Jack', 'Queen', 'King', 'Ace'],
:ranks => [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}


@suits.each do |suit|
  13.times do
    v = ranks_values.fetch(:values).shift
      ranks_values.fetch(:values).push(v)
    r = ranks_values.fetch(:ranks).shift
      ranks_values.fetch(:ranks).push(r)
    @full_deck.push(Card.new(suit, v, r))
  end
  # require 'pry'; binding.pry
  # require 'pry'; binding.pry
end





# p full_deck
