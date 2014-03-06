#!/usr/bin/env ruby
require 'bundler'
Bundler.setup

# Add /lib/ to our load path
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require 'apps/lockdown'

run Sinatra::Application
