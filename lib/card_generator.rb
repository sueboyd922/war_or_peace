require './lib/card.rb'


class CardGenerator

  attr_reader :deck
  # initialize the CardGenerator by calling the txt file holding the card data
  def initialize(file)
    @deck = []
    @file = file
  end

  # method to create cards for the deck array
  def create_cards
    # pull info from txt file and strip the line breaks
    stripped_lines = File.open(@file).map do |line|
      line.strip
    end
    # split the file into arrays by line
    lines_to_arrays = stripped_lines.map do |line|
      line.split(", ")
    end
    # iterate through each line array and create card objects
    lines_to_arrays.each do |card|
      value = card[0]
      suit = card[1].to_sym
      rank = card[2].to_i
      @deck.push(Card.new(suit, value, rank))
    end
  end

  #method to shuffle created deck
  def shuffle
    @deck.shuffle!
  end
end
