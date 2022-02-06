require 'rspec'
require './lib/deck'

# 7 tests total

describe Deck do
  describe 'test set 1' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    describe '#initialize' do
      it 'is an instance of the Deck class' do
        expect(deck).to be_an_instance_of(Deck)
      end
    end

    describe '#rank_of_card_at' do
      it 'tells you what rank a specific card is' do
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
      end
    end

    describe 'high_ranking_cards' do
      it 'tells you the high cards in the deck' do
        deck.high_ranking_cards
        expect(deck.high_ranking_cards.count).to eq(2)
        expect(deck.high_ranking_cards).to eq([card1, card3])
        expect(deck.high_ranking_cards[0].value).to eq('Queen')
      end
    end

    describe '#percent_high_ranking' do
      it 'can tell you the percent of high cards in a deck' do
        deck.high_ranking_cards
        expect(deck.percent_high_ranking).to eq(66.67)
      end
    end
  end

  describe 'test set 2' do
    card1 = Card.new(:diamond, '10', 10)
    card2 = Card.new(:spade, 'Jack', 11)
    card3 = Card.new(:heart, '5', 5)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    describe '#remove_card' do
      it 'can remove a card from the deck' do
        expect(deck.cards.count).to eq(3)
        expect(deck.remove_card).to eq(card1)
        expect(deck.cards.count).to eq(2)
      end
    end

    describe '#add_card' do
      it 'can add a card to the deck' do
        card4 = Card.new(:club, '5', 5)
        deck.add_card(card4)
        expect(deck.cards).to eq([card2, card3, card4])
      end

      it 'can tell you the new high cards' do
        expect(deck.percent_high_ranking).to eq(33.33)
        card4 = Card.new(:club, '5', 5)
        deck.add_card(card4)
        expect(deck.high_ranking_cards).to eq([card2])
        expect(deck.percent_high_ranking).to eq(25)
      end
    end
  end
end
