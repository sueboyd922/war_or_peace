require 'rspec'
require './lib/game'

# 2 tests
$deck1 = []
$deck2 = []
player1 = Player.new('Joe', Deck.new($deck1))
player2 = Player.new('Amy', Deck.new($deck2))

describe Game do
  it 'is an instance of the game class' do
    game = Game.new(player1, player2)

    expect(game).to be_an_instance_of(Game)
  end

  it 'can create a deck of cards' do
    game = Game.new(player1, player2)

    game.shuffle_and_deal
    expect(player1.deck.cards.count).to eq(26)
    expect(player2.deck.cards.count).to eq(26)
  end
end
