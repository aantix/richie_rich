require 'yahoo_stock'
class QuotesAdapter
  def self.retrieve(symbol, lookback = 200)
    history = YahooStock::History.new(:stock_symbol => symbol, :start_date => Date.today - lookback, :end_date => Date.today - 1)    
    history.results(:to_hash).output
  end
end