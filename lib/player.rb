require './lib/deck'

class Player
  #initialize an object of Player class with readable attributes of name and deck
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  # method to determine if player has lost the game: if their cards array is empty they have lost
  def has_lost?
    @has_lost = deck.cards.empty?
  end
end
