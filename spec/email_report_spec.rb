require 'spec_helper'
require 'net/smtp'

describe EmailReport do
  before(:all) do
   @smtp_options  = {:server   => "example.com",
                     :username => "username",
                     :password => "password",
                     :from     => "fund-anaylsis@localhost",
                     :tls      => false}    
  end
  
  before(:each) do
    Net::SMTP.any_instance.stub(:start)

    @email = EmailReport.new(@smtp_options)
  end
  
  describe ".message" do
    before(:all) do
      @results = {}
      result   = true
      SYMBOLS.each do |s,allocation|
        @results[s] = [result, allocation]
        result      = !result 
      end
      
    end
    
    it "should return a message with the individual stock symbols listed" do
      message = @email.send(:message, @results)
      SYMBOLS.each {|s,allocation| message.should =~ /#{s}/}
    end
  end

end