require 'spec_helper'

describe MovingAverage do
  before(:each) do
    @result_data = [{:date=>"2011-11-04", :open=>"15.39", :high=>"15.54", :low=>"14.95", :close=>"15.24", :volume=>"41830800", :adj_close=>"15.24"}, 
                    {:date=>"2011-11-03", :open=>"15.20", :high=>"15.50", :low=>"15.03", :close=>"15.48", :volume=>"16809500", :adj_close=>"15.48"}, 
                    {:date=>"2011-11-02", :open=>"15.10", :high=>"15.30", :low=>"15.00", :close=>"15.10", :volume=>"20758800", :adj_close=>"15.10"}, 
                    {:date=>"2011-11-01", :open=>"14.95", :high=>"15.08", :low=>"14.75", :close=>"14.93", :volume=>"41834700", :adj_close=>"14.93"}, 
                    {:date=>"2011-10-31", :open=>"16.06", :high=>"16.07", :low=>"15.45", :close=>"15.64", :volume=>"39752100", :adj_close=>"15.64"}, 
                    {:date=>"2011-10-28", :open=>"16.41", :high=>"16.70", :low=>"16.25", :close=>"16.56", :volume=>"20166900", :adj_close=>"16.56"}, 
                    {:date=>"2011-10-27", :open=>"16.56", :high=>"16.70", :low=>"16.45", :close=>"16.63", :volume=>"19736500", :adj_close=>"16.63"}, 
                    {:date=>"2011-10-26", :open=>"16.33", :high=>"16.44", :low=>"15.86", :close=>"16.30", :volume=>"23630100", :adj_close=>"16.30"}, 
                    {:date=>"2011-10-25", :open=>"16.66", :high=>"16.70", :low=>"16.18", :close=>"16.24", :volume=>"24046900", :adj_close=>"16.24"}, 
                    {:date=>"2011-10-24", :open=>"16.57", :high=>"16.75", :low=>"16.31", :close=>"16.71", :volume=>"29817000", :adj_close=>"16.71"}, 
                    {:date=>"2011-10-21", :open=>"16.38", :high=>"16.39", :low=>"16.06", :close=>"16.12", :volume=>"29688000", :adj_close=>"16.12"}, 
                    {:date=>"2011-10-20", :open=>"16.20", :high=>"16.49", :low=>"15.97", :close=>"16.18", :volume=>"40788400", :adj_close=>"16.18"}, 
                    {:date=>"2011-10-19", :open=>"16.04", :high=>"16.79", :low=>"15.73", :close=>"15.94", :volume=>"54241300", :adj_close=>"15.94"}, 
                    {:date=>"2011-10-18", :open=>"15.72", :high=>"15.74", :low=>"15.11", :close=>"15.47", :volume=>"31346000", :adj_close=>"15.47"}, 
                    {:date=>"2011-10-17", :open=>"15.95", :high=>"16.04", :low=>"15.65", :close=>"15.70", :volume=>"21173700", :adj_close=>"15.70"}]    
  end
  
  it "should be zero" do
    MovingAverage.compute(@result_data).should be_within(0.1).of(15.8)
  end
  
  
end