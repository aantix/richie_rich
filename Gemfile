source 'http://rubygems.org'
gem "rake"
gem "mail"
gem 'nas-yahoo_stock'

# RSpec has to be in both test and development so that rake tasks and generators
# are available without having to explicitly switch the environment to 'test'
group :test, :development do
	gem 'factory_girl', '>= 1.3.2'
	gem 'rspec', '> 2.5.0'
  gem 'mocha'
	gem "guard-rspec"
	gem "spork", "> 0.9.0.rc"
	gem "guard-spork"
	gem 'simplecov', :require => false, :group => :test	
	
	if RUBY_PLATFORM.downcase.include?("darwin")
	  gem 'rb-fsevent', ">= 0.4.3.1"
	  gem 'growl', '>= 1.0.3'
	end	
end