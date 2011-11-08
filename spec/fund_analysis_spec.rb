require 'spec_helper'
require 'fund_analysis'

describe FundAnalysis do
  
  it "should produce a BUY signal" do
    data = [{:date=>"2011-11-04", :open=>"15.39", :high=>"15.54", :low=>"14.95", :close=>"16.24", :volume=>"41830800", :adj_close=>"15.24"}, 
            {:date=>"2011-11-03", :open=>"15.20", :high=>"15.50", :low=>"15.03", :close=>"15.48", :volume=>"16809500", :adj_close=>"15.48"}, 
            {:date=>"2011-11-02", :open=>"15.10", :high=>"15.30", :low=>"15.00", :close=>"15.10", :volume=>"20758800", :adj_close=>"15.10"}]
    
    FundAnalysis.is_a_buy?(data).should == true
  end
  
  it "should produce a SELL signal" do
    data = [{:date=>"2011-11-04", :open=>"15.39", :high=>"15.54", :low=>"14.95", :close=>"14.24", :volume=>"41830800", :adj_close=>"15.24"}, 
            {:date=>"2011-11-03", :open=>"15.20", :high=>"15.50", :low=>"15.03", :close=>"15.48", :volume=>"16809500", :adj_close=>"15.48"}, 
            {:date=>"2011-11-02", :open=>"15.10", :high=>"15.30", :low=>"15.00", :close=>"15.10", :volume=>"20758800", :adj_close=>"15.10"}]
    
    FundAnalysis.is_a_buy?(data).should == false
  end
  
end