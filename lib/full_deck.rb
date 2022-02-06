require "./lib/card"
require "./lib/deck"

# create a full deck from array/hashes
# array of 4 suits
@suits = [:diamonds, :hearts, :spades, :clubs]
# empty deck array
$full_deck = []
# hash of ranks/values, keys are values/ranks with their values being arrays of 'value' and 'rank'
ranks_values = {:values => ['two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'Jack', 'Queen', 'King', 'Ace'],
:ranks => [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}

# iterate through each suit and for each suit go through the ranks_values array 13 times.
@suits.each do |suit|
  13.times do
    # shift out the first element and store it as v/r and then put it back in the end of the array so that it creates a loop as each suit goes through the loop
    v = ranks_values.fetch(:values).shift
      ranks_values.fetch(:values).push(v)
    r = ranks_values.fetch(:ranks).shift
      ranks_values.fetch(:ranks).push(r)
    # add each card made to the full_deck array 
    $full_deck.push(Card.new(suit, v, r))
  end
end
