#!/usr/local/ruby-current/bin/ruby
require 'rubygems'
require "./lib/quotes_adapter"
require "./lib/moving_average"
require "./lib/fund_analysis"

SYMBOLS = ['VTSMX','NAESX','VEIEX','VEURX','VPACX','VWEHX','VFSTX','VIPSX','VSIX','VGPMX']

results = {}
SYMBOLS.each do |s|
  historical_pricing = QuotesAdapter.retrieve(s)
  buy_it             = FundAnalysis.is_a_buy?(historical_pricing)
  results[s]         = buy_it
end

EmailReport.send(results, 'jim.jones1@gmail.com')
