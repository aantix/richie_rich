require 'spec_helper'
require 'fund_analysis'

describe FundAnalysis do

  describe "#is_a_buy" do
    it "should produce a BUY signal" do
      FundAnalysis.is_a_buy?(above_moving_average).should == true
    end
  
    it "should produce a SELL signal" do
      FundAnalysis.is_a_buy?(below_moving_average).should == false
    end
  end
  
  describe "#agreggate_results_for" do
    before(:each) do
      QuotesAdapter.stub!(:retrieve).and_return above_moving_average
    end
    
    it "should return a hash with the symbol and a buy signal" do
      FundAnalysis.agreggate_results_for({'VTSMX' => 0.1}).should == {'VTSMX' => [true, 0.1]}
    end
    
  end
  
  def above_moving_average
    [{:date=>"2011-11-04", :open=>"15.39", :high=>"15.54", :low=>"14.95", :close=>"16.24", :volume=>"41830800", :adj_close=>"15.24"}, 
     {:date=>"2011-11-03", :open=>"15.20", :high=>"15.50", :low=>"15.03", :close=>"15.48", :volume=>"16809500", :adj_close=>"15.48"}, 
     {:date=>"2011-11-02", :open=>"15.10", :high=>"15.30", :low=>"15.00", :close=>"15.10", :volume=>"20758800", :adj_close=>"15.10"}]
  end
  
  def below_moving_average
    [{:date=>"2011-11-04", :open=>"15.39", :high=>"15.54", :low=>"14.95", :close=>"14.24", :volume=>"41830800", :adj_close=>"15.24"}, 
     {:date=>"2011-11-03", :open=>"15.20", :high=>"15.50", :low=>"15.03", :close=>"15.48", :volume=>"16809500", :adj_close=>"15.48"}, 
     {:date=>"2011-11-02", :open=>"15.10", :high=>"15.30", :low=>"15.00", :close=>"15.10", :volume=>"20758800", :adj_close=>"15.10"}]
  end
  
end