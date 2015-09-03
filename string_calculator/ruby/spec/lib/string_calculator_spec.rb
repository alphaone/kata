require 'string_calculator.rb'

describe StringCalculator do

  let (:string_calculator) {StringCalculator.new}

  it "has a `add` method " do
    string_calculator.add("")
  end

  it "returns 0 for empty inputs" do
    string_calculator.add("").should == 0
  end

  it "returns the given number, if just one number given" do
    string_calculator.add("3").should == 3
  end

  it "adds two given numbers" do
    string_calculator.add("3,5").should == 8
  end

  it "adds all given numbers" do
    string_calculator.add("3,5,6,7").should == 21
  end

  it "can handle line-breaks as separator" do
    string_calculator.add("3\n5,6\n7").should == 21
  end

  it "supports a custom delimiter" do
    string_calculator.add("//;\n3;5").should == 8
  end

  it "raises an exception on negative numbers" do
    expect {
      string_calculator.add("-1,2")
    }.to raise_error "negatives not allowed: -1"
  end

  it "exception contains all negative numbers" do
    expect {
      string_calculator.add("-2,4,-5")
    }.to raise_error "negatives not allowed: -2,-5"
  end

end
