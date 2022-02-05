require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'
require './lib/card_generator'
require './lib/game'
#
# card1 = Card.new(:heart, 'two', 2)
# card2 = Card.new(:heart, 'three', 3)
# card3 = Card.new(:heart, 'four', 4)
# card4 = Card.new(:heart, 'five', 5)
# card5 = Card.new(:heart, 'six', 6)
# card6 = Card.new(:heart, 'seven', 7)
# card7 = Card.new(:heart, 'eight', 8)
# card8 = Card.new(:heart, 'nine', 9)
# card9 = Card.new(:heart, 'ten', 10)
# card10 = Card.new(:heart, 'Jack', 11)
# card11 = Card.new(:heart, 'Queen', 12)
# card12 = Card.new(:heart, 'King', 13)
# card13 = Card.new(:heart, 'Ace', 14)
# card14 = Card.new(:spade, 'two', 2)
# card15 = Card.new(:spade, 'three', 3)
# card16 = Card.new(:spade, 'four', 4)
# card17 = Card.new(:spade, 'five', 5)
# card18 = Card.new(:spade, 'six', 6)
# card19 = Card.new(:spade, 'seven', 7)
# card20 = Card.new(:spade, 'eight', 8)
# card21 = Card.new(:spade, 'nine', 9)
# card22 = Card.new(:spade, 'ten', 10)
# card23 = Card.new(:spade, 'Jack', 11)
# card24 = Card.new(:spade, 'Queen', 12)
# card25 = Card.new(:spade, 'King', 13)
# card26 = Card.new(:spade, 'Ace', 14)
# card27 = Card.new(:diamond, 'two', 2)
# card28 = Card.new(:diamond, 'three', 3)
# card29 = Card.new(:diamond, 'four', 4)
# card30 = Card.new(:diamond, 'five', 5)
# card31 = Card.new(:diamond, 'six', 6)
# card32 = Card.new(:diamond, 'seven', 7)
# card33 = Card.new(:diamond, 'eight', 8)
# card34 = Card.new(:diamond, 'nine', 9)
# card35 = Card.new(:diamond, 'ten', 10)
# card36 = Card.new(:diamond, 'Jack', 11)
# card37 = Card.new(:diamond, 'Queen', 12)
# card38 = Card.new(:diamond, 'King', 13)
# card39 = Card.new(:diamond, 'Ace', 14)
# card40 = Card.new(:club, 'two', 2)
# card41 = Card.new(:club, 'three', 3)
# card42 = Card.new(:club, 'four', 4)
# card43 = Card.new(:club, 'five', 5)
# card44 = Card.new(:club, 'six', 6)
# card45 = Card.new(:club, 'seven', 7)
# card46 = Card.new(:club, 'eight', 8)
# card47 = Card.new(:club, 'nine', 9)
# card48 = Card.new(:club, 'ten', 10)
# card49 = Card.new(:club, 'Jack', 11)
# card50 = Card.new(:club, 'Queen', 12)
# card51 = Card.new(:club, 'King', 13)
# card52 = Card.new(:club, 'Ace', 14)
#
# deck = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52]

# deck1 = []
# deck2 = []
# # deck1 = [card39, card7, card50, card49]
# # deck2 = [card52, card8, card51, card48, card3, card6]
# deck.shuffle!
#
# 26.times do
#   deck1 << deck.shift
#   deck2 << deck.shift
# end


def shuffle
  $full_deck.shuffle!
  @deck1 = []
  @deck2 = []
  26.times do
    @deck1 << $full_deck.shift
    @deck2 << $full_deck.shift
  end
end



def war_or_peace
  puts "Welcome to War! (or Peace)."
  puts "This game will be played with 52 cards."
  puts "Who is playing today?? Type your name!"
  @user_name = gets.chomp
  puts "and your opponent?"
  @user2_name = gets.chomp
  puts "Type 'GO' to start the game!"
  puts "---" * 13
  @go = gets.chomp
  @player1 = Player.new(@user_name, Deck.new(@deck1))
  @player2 = Player.new(@user2_name, Deck.new(@deck2))

  if @go == "GO"
    # require 'pry'; binding.pry
    @game = Game.new(@player1, @player2)
    @game.play_round

    while !@game.winner?
      @game.play_round
      if $turn_num == 1000000
        break
      end
    end

    def break_down
      puts "Basic Turns: #{$basic_num}"
      puts "War Turns: #{$war_num}"
      puts "Mutually Assured Destruction: #{$mad_num}"
      puts "#{@player1.name} had #{@player1.deck.cards.count} cards at the end!"
      puts "#{@player2.name} had #{@player2.deck.cards.count} cards at the end!"
    end

    if @player1.has_lost?
      puts "*~*~*~*🎉 #{@player2.name} wins! 🎉*~*~*~*"
      break_down
    elsif @player2.has_lost?
      puts "*~*~*~*🎉 #{@player1.name} wins! 🎉*~*~*~*"
      break_down
    else
      puts "--" * 5 + "🗡 🤺 DRAW 🤺 🗡 " + "--" * 5
      break_down
    end
  else
    p "Try again!"
  end
end


def start
  shuffle
  war_or_peace
end
# puts "Welcome to War! (or Peace)."
# puts "This game will be played with 52 cards."
# puts "Who is playing today?? Type your name!"
# @user_name = gets.chomp
# puts "and your opponent?"
# @user2_name = gets.chomp
# puts "Type 'GO' to start the game!"
# puts "---" * 13
# @go = gets.chomp
# @player1 = Player.new(@user_name, Deck.new(@deck1))
# @player2 = Player.new(@user2_name, Deck.new(@deck2))
#
# if @go == "GO"
#   # require 'pry'; binding.pry
#   @game = Game.new(@player1, @player2)
#   @game.start
# end

start
