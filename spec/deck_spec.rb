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

  describe '#rank_of_card_at' do
    it 'tells you what rank a specific card is' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end
  end

  # describe 'high_ranking_cards' do
  #   it 'tells you the high cards in the deck' do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  #
  #   expect(deck.high_ranking_cards).to eq()
  #   end
  # end


end
