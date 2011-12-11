require 'spec_helper'

describe QuotesAdapter do
  before(:each) do
    @data = "Date,Open,High,Low,Close,Volume,Adj Close\n"
    @data << "2011-11-04,15.39,15.54,14.95,15.24,41830800,15.24\n\n"
    @data << "2011-11-03,15.20,15.50,15.03,15.48,16809500,15.48\n\n"
    @data << "2011-11-02,15.10,15.30,15.00,15.10,20758800,15.10\n\n"
    @data << "2011-11-01,14.95,15.08,14.75,14.93,41834700,14.93\n\n"
    @data << "2011-10-31,16.06,16.07,15.45,15.64,39752100,15.64\n\n"
    @data << "2011-10-28,16.41,16.70,16.25,16.56,20166900,16.56\n\n"
    @data << "2011-10-27,16.56,16.70,16.45,16.63,19736500,16.63\n\n"
    @data << "2011-10-26,16.33,16.44,15.86,16.30,23630100,16.30\n\n"
    @data << "2011-10-25,16.66,16.70,16.18,16.24,24046900,16.24\n\n"
    @data << "2011-10-24,16.57,16.75,16.31,16.71,29817000,16.71\n\n"
    @data << "2011-10-21,16.38,16.39,16.06,16.12,29688000,16.12\n\n"
    @data << "2011-10-20,16.20,16.49,15.97,16.18,40788400,16.18\n\n"
    @data << "2011-10-19,16.04,16.79,15.73,15.94,54241300,15.94\n\n"
    @data << "2011-10-18,15.72,15.74,15.11,15.47,31346000,15.47\n\n"
    @data << "2011-10-17,15.95,16.04,15.65,15.70,21173700,15.70"

    @results = [{:date=>"2011-11-04",
      :open=>"15.39",
      :high=>"15.54",
      :low=>"14.95",
      :close=>"15.24",
      :volume=>"41830800",
      :adj_close=>"15.24"},
     {},
     {:date=>"2011-11-03",
      :open=>"15.20",
      :high=>"15.50",
      :low=>"15.03",
      :close=>"15.48",
      :volume=>"16809500",
      :adj_close=>"15.48"},
     {},
     {:date=>"2011-11-02",
      :open=>"15.10",
      :high=>"15.30",
      :low=>"15.00",
      :close=>"15.10",
      :volume=>"20758800",
      :adj_close=>"15.10"},
     {},
     {:date=>"2011-11-01",
      :open=>"14.95",
      :high=>"15.08",
      :low=>"14.75",
      :close=>"14.93",
      :volume=>"41834700",
      :adj_close=>"14.93"},
     {},
     {:date=>"2011-10-31",
      :open=>"16.06",
      :high=>"16.07",
      :low=>"15.45",
      :close=>"15.64",
      :volume=>"39752100",
      :adj_close=>"15.64"},
     {},
     {:date=>"2011-10-28",
      :open=>"16.41",
      :high=>"16.70",
      :low=>"16.25",
      :close=>"16.56",
      :volume=>"20166900",
      :adj_close=>"16.56"},
     {},
     {:date=>"2011-10-27",
      :open=>"16.56",
      :high=>"16.70",
      :low=>"16.45",
      :close=>"16.63",
      :volume=>"19736500",
      :adj_close=>"16.63"},
     {},
     {:date=>"2011-10-26",
      :open=>"16.33",
      :high=>"16.44",
      :low=>"15.86",
      :close=>"16.30",
      :volume=>"23630100",
      :adj_close=>"16.30"},
     {},
     {:date=>"2011-10-25",
      :open=>"16.66",
      :high=>"16.70",
      :low=>"16.18",
      :close=>"16.24",
      :volume=>"24046900",
      :adj_close=>"16.24"},
     {},
     {:date=>"2011-10-24",
      :open=>"16.57",
      :high=>"16.75",
      :low=>"16.31",
      :close=>"16.71",
      :volume=>"29817000",
      :adj_close=>"16.71"},
     {},
     {:date=>"2011-10-21",
      :open=>"16.38",
      :high=>"16.39",
      :low=>"16.06",
      :close=>"16.12",
      :volume=>"29688000",
      :adj_close=>"16.12"},
     {},
     {:date=>"2011-10-20",
      :open=>"16.20",
      :high=>"16.49",
      :low=>"15.97",
      :close=>"16.18",
      :volume=>"40788400",
      :adj_close=>"16.18"},
     {},
     {:date=>"2011-10-19",
      :open=>"16.04",
      :high=>"16.79",
      :low=>"15.73",
      :close=>"15.94",
      :volume=>"54241300",
      :adj_close=>"15.94"},
     {},
     {:date=>"2011-10-18",
      :open=>"15.72",
      :high=>"15.74",
      :low=>"15.11",
      :close=>"15.47",
      :volume=>"31346000",
      :adj_close=>"15.47"},
     {},
     {:date=>"2011-10-17",
      :open=>"15.95",
      :high=>"16.04",
      :low=>"15.65",
      :close=>"15.70",
      :volume=>"21173700",
      :adj_close=>"15.70"}]

    @http_mock = mock('Net::HTTPResponse')
    @http_mock.stubs(:code => '200', :message => "OK", :content_type => "text/csv", :body => @data)

    Net::HTTP.stub(:get_response).and_return(@http_mock)
  end
  
  it "should return a hash of quote data" do
    QuotesAdapter.retrieve('yhoo').should == @results
  end
  
  it "should return the full data set" do
    QuotesAdapter.retrieve('yhoo').size.should == @results.size
  end
    
  it "should return a data set equal to the lookback" do
    QuotesAdapter.retrieve('yhoo',10).size.should == 10
  end
end