require 'spec_helper'

describe EmailReport do
  before(:all) do
   @smtp_options  = {:server   => "example.com",
                     :username => "username",
                     :password => "password",
                     :from     => "fund-anaylsis@localhost",
                     :tls      => false}    

   @email = EmailReport.new(@smtp_options)
  end
  
  describe "#message" do
    before(:all) do
      @results = {}
      result   = true
      SYMBOLS.each do |s|
        @results[s] = result
        result      = !result 
      end
      
    end
    
    it "should return a message with the individual stock symbols listed" do
      SYMBOLS.each do |s|
        @email.send(:message, @results, @smtp_options[:from], 'jim.jones1@gmail.com').should =~ /#{s}/
      end
      
    end
  end
end