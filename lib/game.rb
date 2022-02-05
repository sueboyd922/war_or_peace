class Game
  attr_reader :turn_num

  def initialize(player1, player2)
    @p1 = player1
    @p2 = player2
    $turn_num = 0
    $basic_num = 0
    $war_num = 0
    $mad_num = 0
    @turn = Turn.new(@p1, @p2)
  end

  def winner?
    if @p2.has_lost?
      "#{@p1.name} wins"
    elsif @p1.has_lost?
      "#{@p2.name} wins"
    else
      false
    end
  end

  def play_round
    $turn_num += 1
    winner = @turn.winner
    @turn.type
    # @turn.pile_cards
    case @turn.type
    when :basic
      @turn.pile_cards
      @turn.award_spoils(winner)
      $basic_num += 1
      puts "Turn #{$turn_num}: #{winner.name} wins 2 cards!"
    when :war
      @turn.pile_cards
      @turn.award_spoils(winner)
      $war_num += 1
      puts "Turn #{$turn_num}: #{winner.name} wins 6 cards!"
    when :mutually_assured_destruction
      @turn.pile_cards
      $mad_num += 1
      puts "Turn #{$turn_num}: Mutually assured destruction. 6 cards have been removed"
    end
  end

end
