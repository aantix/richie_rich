class FundAnalysis
  def self.is_a_buy?(data)
    avg           = MovingAverage.compute(data)    
    recent_close  = data[0][:close].to_f rescue false
    
    (recent_close > avg)
  end
end