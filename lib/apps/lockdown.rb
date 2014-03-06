require 'sinatra'
require 'sinatra/basic_auth'

if ENV['RACK_ENV'] == "development" || ENV['RACK_ENV'].nil?
  require 'dotenv'
  Dotenv.load
end

# Specify your authorization logic
authorize do |username, password|
  username == ENV['HTTP_AUTH_USER'] &&
    password == ENV['HTTP_AUTH_PASSWD']
end

configure do
  # Serve assets (JS, CSS)
  set :public_folder, 'public'
end

# Set protected routes
protect do
  "Restricted page that only authorized users can access"

  get '/' do
    open 'pages/index.html'
  end

  get '/*.*' do |path, ext|
    puts "Getting #{path}.#{ext}"
    open "pages/#{path}.#{ext}"
  end
end
