require 'yahoo_stock'

class QuotesAdapter
  NUM_TRADING_DAYS = 251

  def self.retrieve(symbol, lookback = 200)
    request_window = lookback * 2   # Request window should be double of lookback period for a far
                                    #  back enough end_date that would include enough data points

    history = YahooStock::History.new(:stock_symbol => symbol, :start_date => Date.today - request_window, :end_date => Date.today - 1)
    results = history.results(:to_hash).output
    results[0..(lookback - 1)]
  end
end