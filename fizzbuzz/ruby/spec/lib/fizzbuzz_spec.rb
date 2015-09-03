require 'fizzbuzz.rb'

describe "FizzBuzz" do

  let (:fizzbuzz) {FizzBuzz.new}

  it "returns the number if nothing to fizz or buzz" do
    fizzbuzz.fizzbuzz(1).should == 1
    fizzbuzz.fizzbuzz(2).should == 2
    fizzbuzz.fizzbuzz(98).should == 98
  end

  it "returns 'fizz' when the number is divisable by 3" do
    fizzbuzz.fizzbuzz(3).should == 'Fizz'
    fizzbuzz.fizzbuzz(99).should == 'Fizz'
  end

  it "returns 'buzz' when the number is divisable by 5" do
    fizzbuzz.fizzbuzz(5).should == 'Buzz'
    fizzbuzz.fizzbuzz(85).should == 'Buzz'
  end

  it "return 'fizzbuzz' if number is divisable by 3 AND 5" do
    fizzbuzz.fizzbuzz(15).should == 'FizzBuzz'
    fizzbuzz.fizzbuzz(75).should == 'FizzBuzz'
  end


  it "can compile a list of all fizzbuzzes upto a given number" do
    fizzbuzz.fizzbuzzes(10).should == [1,2,'Fizz',4,'Buzz','Fizz',7,8,'Fizz','Buzz']
  end

  # stage 2

  it "fizzes numbers with 3 in it" do
    fizzbuzz.fizzbuzz(13).should == 'Fizz'
  end
  it "fizzbuzzes numbers with 5 in it and divisable by 3" do
    fizzbuzz.fizzbuzz(51).should == 'FizzBuzz'
  end
  it "buzzes numbers with 5 in it" do
    fizzbuzz.fizzbuzz(52).should == 'Buzz'
  end
  it "fizzbuzzes numbers with 3 and 5 in it" do
    fizzbuzz.fizzbuzz(53).should == 'FizzBuzz'
  end

end
