class PrimeNumbers

  def prime_factor_for(number)
    return [] if (0..1).include? number

    result = []

    (2..number).each do |factor|
      while divisable?(number, factor)
        result << factor
        number = number / factor
      end
    end

    result.sort {|a,b| b <=> a}
  end

private

  def divisable?(number, factor)
    (number % factor == 0)
  end

end
