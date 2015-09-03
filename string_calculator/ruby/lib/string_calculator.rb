class StringCalculator

  def initialize
    @delimiter = %r{,|\n}
    @negatives = []
  end

  def add(input)
    determine_delimiter(input)

    input.gsub!(%r{//.+?\n})

    result = input.split(@delimiter).inject(0) do |result, n|
      handle_negatives(n)
      result + n.to_i
    end

    raise Exception.new(error_msg) unless @negatives.empty?

    result
  end

private

  def determine_delimiter(text)
    if (text =~ %r{^//(.+?)\n})
      @delimiter = Regexp.last_match(1)
    end
  end

  def handle_negatives(x)
    @negatives << x if x.to_i < 0
  end

  def error_msg
    "negatives not allowed: %s" % [@negatives.join(",")]
  end

end
