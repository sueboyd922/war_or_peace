require './lib/card.rb'


class CardGenerator
  attr_reader :deck

  def initialize(file)
    @deck = []
    @file = file
  end

  def create_cards
    step1 = File.open(@file).map do |line|
      line.strip
    end

    step2 = step1.map do |line|
      line.split(", ")
    end

    step2.each do |card|
      value = card[0]
      suit = card[1].to_sym
      rank = card[2].to_i
      @deck.push(Card.new(suit, value, rank))
    end
  end

  def shuffle
    @deck.shuffle!
  end
end

# $full_deck = CardGenerator.new('./lib/cards.txt')
# # require 'pry'; binding.pry
#
# $full_deck.create_cards
# $full_deck.deck
