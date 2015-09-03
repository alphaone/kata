class FizzBuzz

  def fizzbuzz(number)
    if fizz?(number) && buzz?(number)
      'FizzBuzz'
    elsif fizz?(number)
      'Fizz'
    elsif buzz?(number)
      'Buzz'
    else
      number
    end
  end

  def fizzbuzzes(max)
    1.upto(max).map do |i|
      fizzbuzz(i)
    end
  end

private

  def fizz?(x)
    x % 3 == 0 or x.to_s.include? '3'
  end

  def buzz?(x)
    x % 5 == 0 or x.to_s.include? '5'
  end

end

