#!/usr/local/ruby-current/bin/ruby
require 'rubygems'
require "bundler/setup" 

require "./config.rb"
require "./lib/quotes_adapter"
require "./lib/moving_average"
require "./lib/fund_analysis"
require "./lib/email_report"

results = FundAnalysis.agreggate_results_for SYMBOLS

email   = EmailReport.new(SMTP_OPTIONS)
email.deliver(results, 'jim.jones1@gmail.com')
