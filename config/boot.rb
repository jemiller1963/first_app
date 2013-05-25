require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
# Into config/boot.rb to tell rails server to broadcast on another port
# I use 3333
# This way I do not have to modify nginx.conf to update passenger
require 'rails/commands/server'

module Rails
  class Server
    alias :default_options_alias :default_options
    def default_options
      default_options_alias.merge!(:Port => 3333)
    end    
  end
end
# End add JEM
#