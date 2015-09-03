class Game

  def initialize()
    @score = 0
    @rolls = []
    @roll_index = 0
  end

  def roll(pins)
    @rolls[@roll_index] = pins
    @roll_index += 1
  end

  def score
    i = 0
    10.times do

      if strike?(i)
        @score += 10 + strike_bonus(i)
        i = i + 1
      elsif spare?(i)
        @score += 10 + spare_bonus(i)
        i = i + 2
      else
        @score += sum_of_balls_in_frame(i)
        i = i + 2
      end
    end
    @score
  end

private

  def strike_bonus(i)
    @rolls[i+1] + @rolls[i+2]
  end

  def spare_bonus(i)
    @rolls[i+2]
  end

  def sum_of_balls_in_frame(i)
    @rolls[i] + @rolls[i+1]
  end

  def strike?(i)
    @rolls[i] == 10
  end

  def spare?(i)
    @rolls[i] + @rolls[i+1] == 10
  end

end
