require 'rspec'
require './lib/card_generator'

full_deck = CardGenerator.new('./lib/cards.txt')

describe CardGenerator do
  it 'is an instance of CardGenerator' do
    # full_deck = CardGenerator.new('./lib/cards.txt')
    # require 'pry'; binding.pry
    expect(full_deck).to be_an_instance_of(CardGenerator)
  end

  it 'creates 52 cards' do
    # full_deck = CardGenerator.new('./lib/cards.txt')
    full_deck.create_cards
    require 'pry'; binding.pry
    expect(full_deck.deck.count).to eq(52)
  end

  it 'has 13 of each suit' do
    # full_deck = CardGenerator.new('./lib/cards.txt')
    full_deck.create_cards
  end

end
