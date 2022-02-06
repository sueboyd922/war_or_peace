require './lib/game'

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
  $deck1 = []
  $deck2 = []
  @player1 = Player.new(@user_name, Deck.new($deck1))
  @player2 = Player.new(@user2_name, Deck.new($deck2))

  if @go.upcase == 'GO'
    game = Game.new(@player1, @player2)
    game.shuffle
    game.start
    puts ""
    if @player1.has_lost?
      puts "*~*~*~*🎉 #{@player2.name.upcase} WINS! 🎉*~*~*~*"
    elsif @player2.has_lost?
      puts "*~*~*~*🎉 #{@player1.name.upcase} WINS! 🎉*~*~*~*"
    elsif
      puts "--" * 5 + "🗡 🤺 DRAW 🤺 🗡 " + "--" * 5
    end
    puts ""
    game.break_down
  else
    puts "Try again!"
  end
end


war_or_peace
