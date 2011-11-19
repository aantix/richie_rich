SYMBOLS       = ['VTSMX','NAESX','VEIEX','VEURX','VPACX','VWEHX','VFSTX','VIPSX','VGSIX','VGPMX']

# Be sure to enable pop3 if you're going to be mailing with Gmail's SMTP server.
# https://mail.google.com/support/bin/answer.py?answer=13273
SMTP_OPTIONS  = {:address    => "smtp.gmail.com",
                :domain      => 'gmail.com',
                :username    => "your.gmailaccount@gmail.com",
                :password    => "yourpassword",
                :port        => 587,
                :from        => "your.gmailaccount@gmail.com",
                :subject     => "Fund Rebalance Report",
                :tls         => true}