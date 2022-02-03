require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

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
    it 'is an instance of the Turn class' do
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)

      expect(turn).to be_an_instance_of(Turn)
    end
  end

  describe '#type' do
    it 'it can tell you which type of turn it will be' do
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:war)

    end
  end

  describe '#winner' do
    it 'can tell you who wins the turn' do
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      expect(turn.winner.name).to eq("Megan")
    end
  end

  describe '#pile_cards' do
    it 'runs the #type method first' do
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)

      turn.pile_cards
      expect(turn.type). to eq(:basic)
    end


    it 'adds the cards in play to the spoils of war array' do
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      turn.pile_cards
      expect(player1.deck.cards.count).to eq(3)
      expect(player2.deck.cards.count).to eq(3)
      expect(turn.spoils_of_war.count).to eq(2)
      expect(turn.spoils_of_war.map {|card| card.value}).to eq(["Jack", "9"])
    end
  end

  describe '#award_spoils' do
    it "adds the cards from spoils of war to the winner's deck" do
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      winner = turn.winner

      turn.pile_cards
      turn.award_spoils(winner)
      expect(player1.deck.cards.count).to eq(5)
      expect(player2.deck.cards.count).to eq(3)
      expect(turn.spoils_of_war.count).to eq(0)

    end

    it 'can play a second turn' do
      deck1 = Deck.new([card1, card4, card5, card8])
      deck2 = Deck.new([card3, card2, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      winner = turn.winner

      turn.pile_cards
      turn.award_spoils(winner)

      turn2 = Turn.new(player1, player2)
      winner2 = turn2.winner
      turn2.pile_cards
      turn2.award_spoils(winner2)

      expect(player1.deck.cards.count).to eq(6)
      expect(player2.deck.cards.count).to eq(2)
    end
  end

  describe 'Check war option' do
    it 'can play war' do
      deck1 = Deck.new([card1, card3, card5, card8])
      deck2 = Deck.new([card4, card2, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:war)
    end

    it 'has a winner that gains 3 more cards' do
      deck1 = Deck.new([card1, card3, card5, card8])
      deck2 = Deck.new([card4, card2, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      winner = turn.winner
      expect(winner.name).to eq('Aurora')

      turn.pile_cards
      expect(turn.spoils_of_war.count).to eq(6)

      turn.award_spoils(winner)
      expect(player2.deck.cards.count).to eq(7)
      expect(player1.deck.cards.count).to eq(1)
      expect(turn.spoils_of_war.count).to eq(0)
    end
  end

  describe 'check mutually_assured_destruction option' do
    it 'can have have type mutually_assured_destruction' do
      card9 = Card.new(:spade, 'seven', 7)
      card10 = Card.new(:diamond, 'seven', 7)
      deck1 = Deck.new([card1, card3, card9, card5, card8])
      deck2 = Deck.new([card4, card2, card10, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:mutually_assured_destruction)
    end

    it 'has no winner' do
      card9 = Card.new(:spade, 'seven', 7)
      card10 = Card.new(:diamond, 'seven', 7)
      deck1 = Deck.new([card1, card3, card9, card5, card8])
      deck2 = Deck.new([card4, card2, card10, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      expect(turn.winner).to eq("There is no winner!")
    end

    it 'removes all 6 affected cards from play' do
      card9 = Card.new(:spade, 'seven', 7)
      card10 = Card.new(:diamond, 'seven', 7)
      deck1 = Deck.new([card1, card3, card9, card5, card8])
      deck2 = Deck.new([card4, card2, card10, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([])
      expect(player1.deck.cards.count).to eq(2)
      expect(player2.deck.cards.count).to eq(2)
    end


  end


end
