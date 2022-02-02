require './card'
require './deck'
require './player'

class Turn
  attr_reader :player1, :player2, :type
  def initialize(player1, player2)
    @player1 = player1.deck.cards[0]
    @player2 = player2.deck.cards[0]
    @type = ''
  end


end
