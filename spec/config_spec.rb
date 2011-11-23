require 'spec_helper'

describe "Config" do
  it "should have allocations that add up to 1.0 (100%)" do
    total = SYMBOLS.inject(0){|total, (s,allocation)| total+=allocation}
    total.should be_within(0.00001).of(1.00)
  end
end