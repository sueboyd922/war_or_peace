require './lib/turn'
require './lib/card_generator'

# def shuffle
#   @full_deck.shuffle!
#   @deck1 = []
#   @deck2 = []
#   26.times do
#     @deck1 << @full_deck.shift
#     @deck2 << @full_deck.shift
#   end
# end


#
# def war_or_peace
#   puts "Welcome to War! (or Peace)."
#   puts "This game will be played with 52 cards."
#   puts "Who is playing today?? Type your name!"
#   @user_name = gets.chomp
#   puts "and your opponent?"
#   @user2_name = gets.chomp
#   puts "Type 'GO' to start the game!"
#   puts "---" * 13
#   @go = gets.chomp
#   @player1 = Player.new(@user_name, Deck.new(@deck1))
#   @player2 = Player.new(@user2_name, Deck.new(@deck2))
#
#   if @go == "GO"
#     # require 'pry'; binding.pry
#     @game = Game.new(@player1, @player2)
#     @game.play_round
#
#     while !@game.winner?
#       @game.play_round
#       if $turn_num == 1000000
#         break
#       end
#     end
#
#     def break_down
#       puts "Basic Turns: #{$basic_num}"
#       puts "War Turns: #{$war_num}"
#       puts "Mutually Assured Destruction: #{$mad_num}"
#       puts "#{@player1.name} had #{@player1.deck.cards.count} cards at the end!"
#       puts "#{@player2.name} had #{@player2.deck.cards.count} cards at the end!"
#     end
#
#     if @player1.has_lost?
#       puts "*~*~*~*🎉 #{@player2.name} wins! 🎉*~*~*~*"
#       break_down
#     elsif @player2.has_lost?
#       puts "*~*~*~*🎉 #{@player1.name} wins! 🎉*~*~*~*"
#       break_down
#     else
#       puts "--" * 5 + "🗡 🤺 DRAW 🤺 🗡 " + "--" * 5
#       break_down
#     end
#   else
#     p "Try again!"
#   end
# end


# def start
#   shuffle
#   war_or_peace
# end

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


  # def start
  #   shuffle
  #   war_or_peace
  # end
  #
  # def shuffle
  #   require 'pry'; binding.pry
  #   $full_deck.shuffle!
  #   @deck1 = []
  #   @deck2 = []
  #   26.times do
  #     @deck1 << $full_deck.shift
  #     @deck2 << $full_deck.shift
  #   end
  # end

  def winner?
    if @p2.has_lost?
      @p1
    elsif @p1.has_lost?
      @p2
    else
      false
    end
  end
  #
  # def war_or_peace
  #   # puts "Welcome to War! (or Peace)."
  #   # puts "This game will be played with 52 cards."
  #   # puts "Who is playing today?? Type your name!"
  #   # @user_name = gets.chomp
  #   # puts "and your opponent?"
  #   # @user2_name = gets.chomp
  #   # puts "Type 'GO' to start the game!"
  #   # puts "---" * 13
  #   # @go = gets.chomp
  #   # @player1 = Player.new(@user_name, Deck.new(@deck1))
  #   # @player2 = Player.new(@user2_name, Deck.new(@deck2))
  #
  #   # if @go == "GO"
  #   #   # require 'pry'; binding.pry
  #   #   @game = Game.new(@player1, @player2)
  #   #   @game.play_round
  #
  # # while !@game.winner?
  # while !winner?
  #   @game.play_round
  #   require 'pry'; binding.pry
  #   if $turn_num == 1000000
  #     break
  #   end
  # end
  #
  #     def break_down
  #       puts "Basic Turns: #{$basic_num}"
  #       puts "War Turns: #{$war_num}"
  #       puts "Mutually Assured Destruction: #{$mad_num}"
  #       puts "#{@player1.name} had #{@player1.deck.cards.count} cards at the end!"
  #       puts "#{@player2.name} had #{@player2.deck.cards.count} cards at the end!"
  #     end
  #
  #     if @player1.has_lost?
  #       puts "*~*~*~*🎉 #{@player2.name} wins! 🎉*~*~*~*"
  #       break_down
  #     elsif @player2.has_lost?
  #       puts "*~*~*~*🎉 #{@player1.name} wins! 🎉*~*~*~*"
  #       break_down
  #     else
  #       puts "--" * 5 + "🗡 🤺 DRAW 🤺 🗡 " + "--" * 5
  #       break_down
  #     end
  #   # else
  #   #   p "Try again!"
  #   end
  # end


  def play_round
    $turn_num += 1
    winner = @turn.winner
    @turn.type
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
