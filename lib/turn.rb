require './card'
require './deck'
require './player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @type = ''
    @spoils_of_war = []
  end

  def type
    @p1 = @player1.deck.cards
    @p2 = @player2.deck.cards
    if @p1[0].rank == @p2[0].rank
      if @p1[2].rank == @p2[2].rank
        @type = :mutually_assured_destruction
      else
        @type = :war
      end
    else
      @type = :basic
    end
  end

  def winner
    type
    case @type
    when :basic
      if @p1[0].rank > @p2[0].rank
        return @player1
      else
        return @player2
      end
    when :war
      if @p1[2].rank > @p2[2].rank
        return @player1
      else
        return @player2
      end
    when :mutually_assured_destruction
      "There is no winner!"
    end
  end



  def pile_cards
    type
    case @type
    when :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    when :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    when :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    until @spoils_of_war.empty? == true
      winner.deck.cards << @spoils_of_war.shift
    end
  end

end
