class ColorSelection

  count = 100
  print 'What is your number?'
  winNumber = gets.to_i



  if (winNumber >= 1) && (winNumber <= 10) && (winNumber%2==0)
      numberColor = 'black'
      puts 'that color is ' + numberColor + ''

    elsif (winNumber >= 11) && (winNumber <= 17) && (winNumber %2 ==1)
      numberColor = 'black'
      puts 'that color is ' + numberColor + ''

    elsif (winNumber >= 20) && (winNumber <= 28) && (winNumber %2==0)
      numberColor = 'black'
      puts 'that color is ' + numberColor + ''

    elsif (winNumber >=29) && (winNumber <= 35) && (winNumber %2==1)
      numberColor = 'black'
      puts 'that color is ' + numberColor + ''
    else numberColor = 'red'
    puts 'that color is ' + numberColor

    end
  end






      





          \




