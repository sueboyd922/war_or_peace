require 'rspec'
require './lib/turn'

#11 tests
card1 = Card.new(:heart, 'Jack', 11)
card2 = Card.new(:heart, '10', 10)
card3 = Card.new(:heart, '9', 9)
card4 = Card.new(:diamond, 'Jack', 11)
card5 = Card.new(:heart, '8', 8)
card6 = Card.new(:diamond, 'Queen', 12)
card7 = Card.new(:heart, '3', 3)
card8 = Card.new(:diamond, '2', 2)

describe Turn do
  describe '#initialize' do
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)

    it 'is an instance of the Turn class' do
      expect(turn).to be_an_instance_of(Turn)
    end

    it 'it can tell you which type of turn it will be' do
      expect(turn.type).to eq(:basic)
    end

    it 'can tell you who wins the turn' do
      expect(turn.winner.name).to eq("Megan")
    end
  end

  describe '#pile_cards' do
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    it 'adds the cards in play to the spoils of war array' do
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card3])
    end
  end

  describe '#award_spoils' do
    deck1 = Deck.new([card1, card4, card5, card8])
    deck2 = Deck.new([card3, card2, card6, card7])
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner

    it "adds the cards from spoils of war to the winner's deck" do
      turn.pile_cards
      turn.award_spoils(winner)
      expect(player1.deck.cards).to eq([card4, card5, card8, card1, card3])
      expect(player2.deck.cards).to eq([card2, card6, card7])
      expect(turn.spoils_of_war).to eq([])
    end

    it 'can play a second turn' do
      turn2 = Turn.new(player1, player2)
      winner2 = turn2.winner
      turn2.pile_cards
      turn2.award_spoils(winner2)

      expect(player1.deck.cards).to eq([card5, card8, card1, card3, card4, card2])
      expect(player2.deck.cards).to eq([card6, card7])
    end
  end

  describe 'Check war option' do
    deck1 = Deck.new([card1, card3, card5, card8])
    deck2 = Deck.new([card4, card2, card6, card7])
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner

    it 'can have type war' do
      expect(turn.type).to eq(:war)
    end

    it 'has a winner that wins 6 cards' do
      expect(winner.name).to eq('Aurora')

      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card4, card3, card2, card5, card6])

      turn.award_spoils(winner)

      expect(player2.deck.cards).to eq([card7, card1, card4, card3, card2, card5, card6])
      expect(player1.deck.cards).to eq([card8])
      expect(turn.spoils_of_war).to eq([])
    end
  end

  describe 'check mutually_assured_destruction option' do
    card9 = Card.new(:spade, 'seven', 7)
    card10 = Card.new(:diamond, 'seven', 7)
    deck1 = Deck.new([card1, card3, card9, card5, card8])
    deck2 = Deck.new([card4, card2, card10, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)

    it 'can have have type mutually_assured_destruction' do
      expect(turn.type).to eq(:mutually_assured_destruction)
    end

    it 'has no winner' do
      expect(turn.winner).to eq(nil)
    end

    it 'removes all 6 affected cards from play' do
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([])
      expect(player1.deck.cards).to eq([card5, card8])
      expect(player2.deck.cards).to eq([card6, card7])
    end
  end
end
