require 'rspec'
require './lib/card'

#3 tests total

RSpec.describe Card do
  it "exists" do
    card = Card.new(:heart, 'Jack', 11)

    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:heart, 'Jack', 11)

    expect(card.suit).to eq(:heart)
    expect(card.value).to eq('Jack')
    expect(card.rank).to eq(11)
  end

  it 'can be a different card' do
    card = Card.new(:hearts, 'eight', 8)

    expect(card.suit).to eq(:hearts)
    expect(card.value).to eq('eight')
    expect(card.rank).to eq(8)
  end
end
