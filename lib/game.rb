require './lib/turn'
require './lib/card_generator'

class Game

  def initialize(player1, player2)
    @p1 = player1
    @p2 = player2
    @turn_num = 0
    @basic_num = 0
    @war_num = 0
    @mad_num = 0
    @turn = Turn.new(@p1, @p2)
  end

  def shuffle_and_deal
    $full_deck = CardGenerator.new('./lib/cards.txt')
    $full_deck.create_cards
    $full_deck.shuffle
    26.times do
      $deck1 << $full_deck.deck.shift
      $deck2 << $full_deck.deck.shift
    end
  end

  def start
    until @p1.has_lost? || @p2.has_lost?
    @turn_num += 1
    winner = @turn.winner
    @turn.type
      case @turn.type
      when :basic
        @turn.pile_cards
        @turn.award_spoils(winner)
        @basic_num += 1
        puts "Turn #{@turn_num}: #{winner.name} wins 2 cards!"
      when :war
        @turn.pile_cards
        @turn.award_spoils(winner)
        @war_num += 1
        puts "Turn #{@turn_num}: 🗡  WAR 🗡  #{winner.name} wins 6 cards!"
      when :mutually_assured_destruction
        @turn.pile_cards
        @mad_num += 1
        puts "Turn #{@turn_num}: 💣 Mutually assured destruction 💣 6 cards have been removed"
      end

      break if @turn_num == 100000
    end
  end

  def break_down
    puts " 🍞 Basic Turns: #{@basic_num}"
    puts " 🗡  War Turns: #{@war_num}"
    puts " 💣 Mutually Assured Destruction: #{@mad_num}"
    puts ""
    puts "#{@p1.name} had #{@p1.deck.cards.compact.count} cards at the end!"
    puts "#{@p2.name} had #{@p2.deck.cards.compact.count} cards at the end!"
    puts "There were #{@turn.discard_pile.count} cards discarded!"
  end

end
