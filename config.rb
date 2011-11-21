SYMBOLS       = ['VTSMX','NAESX','VEIEX','VEURX','VPACX','VWEHX','VFSTX','VIPSX','VGSIX','VGPMX']

SMTP_OPTIONS  = {:address    => "smtp.gmail.com",
                :domain      => 'gmail.com',
                :username    => "your.name@gmail.com",
                :password    => "password",
                :port        => 587,
                :from        => "your.name@gmail.com",
                :subject     => "Fund Rebalance Report",
                :tls         => true}