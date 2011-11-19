require 'net/smtp'
require 'mail'

class EmailReport
  def initialize(connect_options)
    raise ArgumentError.new("Must provide SMTP authentication details. Check the config.rb to make sure they're specified.") if connect_options.empty?
    
    smtp_conn = Net::SMTP.new(connect_options[:address], connect_options[:port])
    smtp_conn.enable_starttls if connect_options[:tls]
    smtp_conn.start(connect_options[:address], connect_options[:username], connect_options[:password], :plain)

    Mail.defaults do
      delivery_method :smtp_connection, { :connection => smtp_conn }
    end

    @connect_options = connect_options
  end

  def deliver(results, to)
    puts "Sending report to #{to}..."
    
    mail         = Mail.new
    mail.to      = to
    mail.from    = @connect_options[:from]
    mail.subject = @connect_options[:subject]
    msg          = message(results)
    
    html_part    = Mail::Part.new do
      content_type 'text/html; charset=UTF-8'
      body msg
    end    
    
    mail.html_part = html_part
    mail.deliver!
    
    puts "Sent."
        
  end
  
private
  def result_label(is_a_buy)
    is_a_buy ? "<font color=\"green\">Buy/Hold</font>" : "<font color=\"red\">Sell/Cash Position</red>"
  end
  
  def message(results)
    message =  "<table cellpadding=\"2\" cellspacing=\"0\" border=1 width=\"445px\">"
    message << "<tr><td colspan=3>&nbsp;</td></tr>"
    results.each do |s,r|
      message << "<tr>"
      message << "  <td width=120>&nbsp;Symbol:&nbsp;&nbsp;<b>#{s}</b></td>"
      message << "  <td width=180>&nbsp;Action:&nbsp;&nbsp;<b>#{result_label(r)}</b></td>"
      message << "</tr>"      
      message << "<tr><td colspan=3>"
      message << "  <a href=\"http://finance.yahoo.com/q/ta?s=#{s}&t=1y&l=on&z=l&q=l&p=m200&a=&c=\">"
      message << "    <img src=\"http://chart.finance.yahoo.com/z?s=#{s}&t=1y&q=l&l=on&z=l&a=v&p=m200&lang=en-US&region=US\"/>"
      message << "  </a>"
      message << "</td></tr>"
    end
    message << "</table>"

  end
  
end