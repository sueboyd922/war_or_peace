require 'rspec'
require './lib/player'

# 4 tests total
card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
deck = Deck.new([card1, card2, card3])
player = Player.new('Clarisa', deck)

describe Player do
  describe '#initialize' do
    it 'it is an instance of Player class' do
      expect(player).to be_an_instance_of(Player)
    end

    it 'has a name' do
      expect(player.name).to eq('Clarisa')
    end

    it 'has a deck of cards' do
      expect(player.deck.cards).to eq([card1, card2, card3])
    end
  end

  describe '#has_lost' do
    it 'can tell you if the player has lost the game' do
      expect(player.has_lost?).to be false
      player.deck.remove_card
      expect(player.has_lost?).to be false
      2.times do
        player.deck.remove_card
      end
      expect(player.has_lost?).to be true
    end
  end
end
