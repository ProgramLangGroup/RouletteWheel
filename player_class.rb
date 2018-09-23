class Player_Class
  playerWallet = 100

  print "What is your name? \n"
  playerName = gets.chomp.capitalize
  puts 'Welcome ' + playerName + "! \n"

  while playerWallet > 0

    puts "You have money for a wager. Would you like to wager? Yes/No \n"
    wagerAsk = gets.chomp.downcase

    if wagerAsk == 'yes'
      puts "How much would you like to wager? \n"
      playerWager = gets.to_i


      if (playerWager > 0) && (playerWager <= playerWallet)
        puts 'Where would you like to place your wager? Please select either red or black'
        wagerColor = gets.downcase.chomp

        if wagerColor == 'r'
          puts 'this is where the roulette function would be called - red'
        elsif wagerColor == 'b'
          puts 'This is where the roulette function would be called - black'
        else
          puts 'thats not a valid color'

          end

       else puts 'Please place a valid bet. You only have $' + playerWallet.to_s + "\n"
      end

    elsif wagerAsk == 'no'
      puts 'Later Tater!'

    end
  end
end


      





          \




