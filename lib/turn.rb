require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    # @type = ''
    @spoils_of_war = []
  end

  def type
    # @p1 = @player1.deck.cards
    # @p2 = @player2.deck.cards
    if @player1.has_lost? || @player2.has_lost?
      if @player1.has_lost?
        puts "#{@player2.name} wins!"
      else
        puts "#{@player1.name} wins!"
      end
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      
      if @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
        @type = :war
      else
        @type = :mutually_assured_destruction
      end
    else
      @type = :basic
    end
  end

  def winner
    type
    case @type
    when :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    when :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    when :mutually_assured_destruction

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
