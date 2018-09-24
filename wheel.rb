class Wheel

  def spin
    @spin = rand(37)

    if (@spin >= 1) and (@spin <= 10) and (@spin.even?)
      @slot = 'black'

    elsif (@spin >= 11) and (@spin <= 17) and (@spin.odd?)
      @slot = 'black'

    elsif (@spin >= 20) and (@spin <= 28) and (@spin.even?)
      @slot = 'black'

    elsif (@spin >= 29) and (@spin <= 35) and (@spin.odd?)
      @slot = 'black'

    else
      @slot = 'red'
    end
  end

  def betting

    if @bank > 0 and @bank < @payout
      spin
      if @color == @slot[0,1].upcase
        @bank = @bank + (@bet)
        puts 'You landed on ' + @slot + '.'
        puts 'You won the bet! Your bank is now at $' + @bank.to_s + '.'

        if @bank >= @payout
          puts 'You have reached your desire payout. The game is now over. Congratulations!'
          exit(1)
        else
          Prompt.prompts(@bank)
        end

      else
        @bank -= @bet
        puts 'You landed on ' + @slot + '.'
        puts 'You lost the bet. Your bank is now at $' + @bank.to_s + '.'
        if @bank<1
          puts 'Sorry, you have nothing left in the bank. The game is now over.'
          exit(1)
        end
        puts "Would you like to double up? (Y for yes N for no)"
        @yes=gets.chomp.to_s

        if @yes.eql? 'Y'
        double_up
        else
          Prompt.prompts(@bank)

        puts @yes
        #if @bank > 0
          #Prompt.prompts(@bank)
        #else
          #puts 'Sorry, you have nothing left in the bank. The game is now over.'
          #exit(1)
        end
      end
    end
  end

  def double_up

    @bet=@bet*2
    betting
    @yes="N"

  end

  def initialize(bank, bet, color, payout)
    @bank = bank
    @bet = bet
    @color = color
    @payout = payout
  end
end

class Prompt

  def self.place_bet
    puts 'What is your bet?'
    @bet = gets.chomp.to_i
    check_bet
  end

  def self.check_bet
    if @bet > @bank
      puts 'You cannot bet more than you have in the bank.'
      place_bet
    end
  end

  def self.pick_color
    puts 'Pick a color: Type "R" for red or "B" for black.'
    @color = gets.chomp.upcase.to_s
    check_color
  end

  def self.check_color
    unless @color.eql? 'R' or @color.eql? 'B'
      puts @color + ' is not a valid input.'
      pick_color
    end
  end

  def self.prompts(bank)
    @bank = bank
    place_bet
    pick_color
    play = Wheel.new(bank, @bet, @color, @payout)
    play.betting
  end

  puts 'How much money do you have?'
  @bank = gets.chomp.to_i
  puts 'What is your desired bank total?'
  @payout = gets.chomp.to_i
  prompts(@bank)
end