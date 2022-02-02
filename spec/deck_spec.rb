require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
  describe '#initialize' do
    it 'is an instance of the Deck class' do
      card1 = Card.new(:diamond, 'Queen', 12)
      deck = Deck.new(card1)

      expect(deck).to be_an_instance_of(Deck)
    end
  end


end
