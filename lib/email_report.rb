require 'net/smtp'

class EmailReport
  def initialize(connect_options)
    raise ArgumentError.new("Must provide SMTP authentication details. Check the config.rb to make sure they're specified.") if connect_options.empty?
    
    @connect_options = connect_options
  end  
  
  def deliver(results, to)
    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_PEER) if @connect_options[:tls]
    
    Net::SMTP.start(connect_options) do |smtp|
      smtp.send_message message(results, @connect_options[:from], to), @connect_options[:from], to
    end    
    
  end
  
private
  def result_label(is_a_buy)
    is_a_buy ? "Buy/Hold" : "Sell/Cash Position"
  end
  
  def message(results,from,to)
    message = <<MESSAGE_END
    From: #{from}
    To: #{to}
    MIME-Version: 1.0
    Content-type: text/html
    Subject: SMTP e-mail test

MESSAGE_END
    
    message << "<table cellpadding=\"0\" cellspacing=\"0\" border=0 width=100%>"
    message << "<tr><th>Symbol</th><th>Chart</th><th>Action</th>"
    results.each do |s,r|
      message << "<tr>"
      message << "  <td>#{s}</td>"
      message << "  <td><a href=\"http://finance.yahoo.com/q/ta?s=#{s}&t=1y&l=on&z=l&q=l&p=m200&a=&c=\">Chart</a></td>"
      message << "  <td>#{result_label(r)}</td>"
      message << "</tr>"      
    end
    message << "</table>"

  end
  
end