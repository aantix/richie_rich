class MovingAverage
  def self.compute(data, period = 200, property = :close)
    sum          = 0
    period_count = 0
    
    data.each do |quote|
      val = quote[property]
      unless val.nil?
        begin
          sum+=val.to_f
          period_count+=1
        rescue
          # Wasn't able to parse sum, moving along..
        end
      end
      break if period_count >= period
    end
    (sum / period_count) 
  end  
end
