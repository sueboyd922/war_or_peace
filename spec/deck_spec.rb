require 'rspec'
require './lib/deck'
require './lib/card'

#7 tests total
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

  describe '#percent_high_ranking' do
    it 'can tell you the percent of high cards in a deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.high_ranking_cards

      expect(deck.percent_high_ranking).to eq(66.67)
    end

    it 'can tell you the percent for another deck' do
      card1 = Card.new(:diamond, '10', 10)
      card2 = Card.new(:spade, 'Jack', 11)
      card3 = Card.new(:heart, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      #deck.high_ranking_cards

      expect(deck.percent_high_ranking).to eq(33.33)
    end
  end

  describe '#remove_card' do
    it 'can remove a card from the deck' do
      card1 = Card.new(:diamond, '10', 10)
      card2 = Card.new(:spade, 'Jack', 11)
      card3 = Card.new(:heart, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards.count).to eq(3)
      deck.remove_card
      expect(deck.cards.count).to eq(2)
    end
  end

  describe '#add_card' do
    it 'can add a card to the deck' do
      card1 = Card.new(:diamond, '10', 10)
      card2 = Card.new(:spade, 'Jack', 11)
      card3 = Card.new(:heart, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards.count).to eq(3)
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)
      expect(deck.cards.count).to eq(4)
    end

    it 'can tell you the new percentage of high cards' do
      card1 = Card.new(:diamond, '10', 10)
      card2 = Card.new(:spade, 'Jack', 11)
      card3 = Card.new(:heart, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.percent_high_ranking).to eq(33.33)
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)
      expect(deck.percent_high_ranking).to eq(25)
    end


  end


end
