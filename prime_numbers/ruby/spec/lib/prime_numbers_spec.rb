require 'prime_numbers.rb'

describe "PrimeNumbers" do

  let (:pn) {PrimeNumbers.new}

  it "should return an empty list for 0" do
    pn.prime_factor_for(0).should == []
  end

  it "should return 1 for 1" do
    pn.prime_factor_for(1).should == []
  end

  it "should return 2 for 2" do
    pn.prime_factor_for(2).should == [2]
  end

  it "should return 3 for 3" do
    pn.prime_factor_for(3).should == [3]
  end

  it "should return 2 for 4" do
    pn.prime_factor_for(4).should == [2,2]
  end

  it "should return 5 for 5" do
    pn.prime_factor_for(5).should == [5]
  end

  it "should return 3,2 for 6" do
    pn.prime_factor_for(6).should == [3,2]
  end

  it "should return 2,2,2 for 8" do
    pn.prime_factor_for(8).should == [2,2,2]
  end

  it "should return 3,3 for 9" do
    pn.prime_factor_for(9).should == [3,3]
  end

  it "should return 3,2,2 for 12" do
    pn.prime_factor_for(12).should == [3,2,2]
  end

  it "should return 17 for 17" do
    pn.prime_factor_for(17).should == [17]
  end

  it "should return 5,3 for 15" do
    pn.prime_factor_for(15).should == [5,3]
  end

  it "should return 5,5 for 25" do
    pn.prime_factor_for(25).should == [5,5]
  end

end
