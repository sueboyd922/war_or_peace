require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

describe Turn do
  describe '#initialize' do
    it 'is an instance of the Turn class' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

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
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:basic)
    end
  end

  describe '#winner' do
    it 'can tell you who wins the turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

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
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new('Megan', deck1)
      player2 = Player.new('Aurora', deck2)

      turn = Turn.new(player1, player2)

      turn.pile_cards
      expect(turn.type). to eq(:basic)
    end


    it 'adds the cards in play to the spoils of war array' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

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
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

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
      require 'pry'; binding.pry
    end

    it 'can play a second turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

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
end
