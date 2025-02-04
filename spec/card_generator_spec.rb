require 'rspec'
require './lib/card_generator'

# 2 tests total
full_deck = CardGenerator.new('./lib/cards.txt')

describe CardGenerator do
  it 'is an instance of CardGenerator' do
    expect(full_deck).to be_an_instance_of(CardGenerator)
  end

  it 'creates 52 cards' do
    full_deck.create_cards
    expect(full_deck.deck.count).to eq(52)
  end

end
