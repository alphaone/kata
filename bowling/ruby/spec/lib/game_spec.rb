require 'game.rb'

describe "Game" do

  let (:game) {Game.new}

  it "gutter game has score 0" do
    roll_many(20,0)
    game.score.should == 0
  end

  it "roll only 1 per frame" do
    roll_many(20,1)
    game.score.should == 20
  end

  it "one simple spare" do
    game.roll(5)
    game.roll(5) # spare
    game.roll(3)
    roll_many(17,0)

    game.score.should == 16
  end

  it "antoher spare" do
    game.roll(0)
    game.roll(0)
    game.roll(4)
    game.roll(6) # spare
    game.roll(2)
    roll_many(15,0)

    game.score.should == 14
  end

  it "one simple strike" do
    game.roll(10) # strike
    game.roll(4)
    game.roll(3)
    roll_many(17,0)

    game.score.should == 24
  end

  it "perfect game" do
    roll_many(12, 10)
    game.score.should == 300
  end

  it "real game" do
    [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6].each do |pins|
      game.roll(pins)
    end
    game.score.should == 133
  end

private

  def roll_many(count, pins)
    count.times do
      game.roll(pins)
    end
  end

end
