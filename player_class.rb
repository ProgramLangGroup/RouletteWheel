class Player_Class


  print 'What is your name? \n'
  playerName = gets.chomp.capitalize
  puts 'Welcome ' + playerName + '!'
  puts 'How much would you like to put in your bank?'
  playerWallet = gets.to_i
  puts 'How much money would you like to make?'
  playerGoal = gets.to_i

  while (playerWallet > 0) && (playerWallet < playerGoal)

    puts 'How much would you like to wager?'
    playerWager = gets.to_i

      if (playerWager > 0) && (playerWager <= playerWallet)
        puts 'Where would you like to place your wager? Please select either red or black'
        wagerColor = gets.downcase.chomp

        if wagerColor == 'red'
          puts 'this is where the roulette function would be called - red'
        elsif wagerColor == 'black'
          puts 'This is where the roulette function would be called - black'
        else
          puts 'that is not a valid color'
        end

      else puts 'Please place a valid bet. You only have $' + playerWallet.to_s + "\n"
      end
    end
  end




      





          \




