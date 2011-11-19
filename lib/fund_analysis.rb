class FundAnalysis
  def self.agreggate_results_for(symbols)
    results = {}
    symbols.each do |s|
      historical_pricing = QuotesAdapter.retrieve(s)
      buy_it             = FundAnalysis.is_a_buy?(historical_pricing)
      results[s]         = buy_it
    end
    results
  end
  
  def self.is_a_buy?(data)
    avg           = MovingAverage.compute(data)    
    recent_close  = data[0][:close].to_f rescue false
    
    (recent_close > avg)
  end
end