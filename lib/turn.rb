require './lib/player'

class Turn
  # initialize an Turn object with two players and two piles (both start empty)
  attr_reader :player1, :player2, :spoils_of_war, :discard_pile

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @discard_pile = []
  end

  # method to determine the type of turn: basic, war, mad
  def type
    #check if the first two cards are equal first
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      #if they are check if the second two are equal
      if @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        #if they are the type is mad
        @type = :mutually_assured_destruction
      else
        #if they aren't the type is war
        @type = :war
      end
    else
      #if the first two cards are not equal the type is basic
      @type = :basic
    end
  end

  #method to determine the winner of a turn based on the type of turn
  def winner
    type #run type first
    case @type
    when :basic #check who has a higher card
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    when :war #check who has a higher card
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    when :mutually_assured_destruction # everyone loses
        "No winner"
    end
  end

  # method to remove cards in play from decks
  def pile_cards
    type # runs type first to see how many cards are removed
    case @type
    when :basic # 1 card each to the spoils of war
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    when :war # 3 cards each to the spoils of war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    when :mutually_assured_destruction # 3 cards each to the discard pile
      3.times do
        @discard_pile << @player1.deck.remove_card
        @discard_pile << @player2.deck.remove_card
      end
    end
  end

  # method to give the spoils to the winner
  def award_spoils(winner)
    until @spoils_of_war.empty? == true
      winner.deck.cards << @spoils_of_war.shift
    end
  end
end
