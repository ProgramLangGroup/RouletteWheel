# class handles roulette logic
class Wheel

  # function generates random number and determines if it is red, black, or green
  def spin
    @spin = rand(37)

    if @spin == 0 or @spin == 37

      if @spin == 37
        @spin == 00
      end

      puts 'Sorry, you landed on green (slot ' + @spin.to_s + '). The game is now over.'
      exit(1)

    elsif ((@spin >= 1) and (@spin <= 10) or (@spin >= 19) and (@spin <= 28)) and (@spin.even?)
      @slot = 'black'

    elsif ((@spin >= 11) and (@spin <= 18) or (@spin >= 29) and (@spin <= 36)) and (@spin.odd?)
      @slot = 'black'

    else
      @slot = 'red'
    end
  end

  # function calls spin function and compares spin result with bet
  def betting
    if @bank > 0 and @bank < @payout
      spin
      if @color == @slot[0,1].upcase
        @bank += @bet
        puts 'You landed on ' + @slot + ' (slot ' + @spin.to_s + ').'
        puts 'You won the bet! Your bank is now at $' + @bank.to_s + '.'

        if @bank >= @payout
          puts 'You have reached/exceeded your desired payout. The game is now over. Congratulations!'
          exit(1)
        else
          Prompt.prompts(@bank)
        end

      else
        @bank -= @bet
        puts 'You landed on ' + @slot + ' (slot ' + @spin.to_s + ').'
        puts 'You lost the bet. Your bank is now at $' + @bank.to_s + '.'

        if @bank > 0
          puts 'Would you like to double up?'
          response = gets.chomp.upcase.to_s

          if response.eql? 'Y'
            double_up
          elsif response.eql? 'N'
            Prompt.prompts(@bank)
          end
        end

        if @bank > 0
          Prompt.prompts(@bank)
        else
          puts 'Sorry, you have nothing left in the bank. The game is now over.'
          exit(1)
        end
      end
    end
  end

  # function takes previous bet and doubles it
  def double_up

    if (@bet * 2) < @bank
      @bet *= 2
      betting
    else
      puts 'You do not have enough in the bank to double up.'
      Prompt.prompts(@bank)
    end
  end

  # constructor initializes variables for wheel class
  def initialize(bank, bet, color, payout)
    @bank = bank
    @bet = bet
    @color = color
    @payout = payout
  end
end

# class prompts user
class Prompt

  # function receives bet
  def self.place_bet
    puts 'What is your bet?'
    @bet = gets.chomp.to_i
    check_bet
  end

  # Function ensures bet does not exceed bank
  def self.check_bet
    if @bet > @bank
      puts 'You cannot bet more than you have in the bank.'
      place_bet
    end
  end

  # function receives color
  def self.pick_color
    puts 'Pick a color: Type "R" for red or "B" for black.'
    @color = gets.chomp.upcase.to_s
    check_color
  end

  # function ensures valid color input
  def self.check_color
    unless @color.eql? 'R' or @color.eql? 'B'
      puts @color + ' is not a valid input.'
      pick_color
    end
  end

  # function calls place_bet and pick_color functions and passes values to wheel class
  def self.prompts(bank)
    @bank = bank
    place_bet
    pick_color
    play = Wheel.new(bank, @bet, @color, @payout)
    play.betting
  end

  # program begins here
  puts 'How much money do you have?'
  @bank = gets.chomp.to_i
  puts 'What is your desired bank total?'
  @payout = gets.chomp.to_i
  prompts(@bank)
end