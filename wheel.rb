class Wheel
  FACTOR = 5.0 / 9
  attr_accessor :number
  def func=(fac)
    @number = (fac - 32) * FACTOR
  end

  def func2
    (@number / FACTOR) + 32
  end

  def initialize(num)
    @number = num
  end
end

t = Wheel.new(25)
puts t.func2 # 77.0
t.func = 60 # invokes f=()
puts t.number # 15.555555555555557