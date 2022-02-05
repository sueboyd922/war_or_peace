# require './lib/cards.txt'
require './lib/card.rb'

file = File.open("./lib/cards.txt").map do |line|
  line.strip
end

# p file

step1 = file.map do |line|
    line.split(", ")
  end

# p step1

full_deck = []

step2 = step1.map do |card|
  value = card[0]
  suit = card[1].to_sym
  rank = card[2].to_i
  cards.push(Card.new(suit, value, rank))
end

p cards
