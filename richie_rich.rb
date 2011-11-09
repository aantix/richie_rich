#!/usr/local/ruby-current/bin/ruby
require 'rubygems'
require "bundler/setup" 

require './config.rb'
require "./lib/quotes_adapter"
require "./lib/moving_average"
require "./lib/fund_analysis"
require './lib/email_report'

results = {}
SYMBOLS.each do |s|
  historical_pricing = QuotesAdapter.retrieve(s)
  buy_it             = FundAnalysis.is_a_buy?(historical_pricing)
  results[s]         = buy_it
end

EmailReport.email(results, 'jim.jones1@gmail.com')
