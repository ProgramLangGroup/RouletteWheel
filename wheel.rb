# class handles roulette logic
class Wheel

  # function generates random number and determines if it is red, black, or green
  def spin

    # generates random number equal to or between 0 and 37
    @spin = rand(37)

    if @spin == 0 or @spin == 37

      if @spin == 37
        @spin = '00'
      end

      @slot = 'green'

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

      # checks if color chosen by user matches spin color
      if @color == @slot[0,1].upcase

        # if green multiply bet by 35 else simply add bet
        if @slot.eql? 'green'
          @bank += (@bet * 35)
        else
          @bank += @bet
        end

        puts 'You landed on ' + @slot + ' (slot ' + @spin.to_s + ').'
        puts 'You won the bet! Your bank is now at $' + @bank.to_s + '.'

        # if desired payout reached exit game else rerun prompt
        if @bank >= @payout
          puts 'You have reached/exceeded your desired payout. The game is now over. Congratulations!'
          exit(1)
        else
          Prompt.prompts(@bank)
        end

      # if color chosen by user does not match spin, subtract bet from bank and prompt user to double up
      else
        @bank -= @bet
        puts 'You landed on ' + @slot + ' (slot ' + @spin.to_s + ').'
        puts 'You lost the bet. Your bank is now at $' + @bank.to_s + '.'

        if @bank > 0
          puts 'Would you like to double up? Type "Y" for yes and "N" for no.'
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

    # checks that there is enough in the bank to double up
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

  # function ensures bet does not exceed bank
  def self.check_bet
    if @bet > @bank
      puts 'You cannot bet more than you have in the bank.'
      place_bet
    end
  end

  # function receives color
  def self.pick_color
    puts 'Pick a color: Type "R" for red, "B" for black, or "G" for green.'
    @color = gets.chomp.upcase.to_s
    check_color
  end

  # function ensures valid color input
  def self.check_color
    unless @color.eql? 'R' or @color.eql? 'B' or @color.eql? 'G'
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