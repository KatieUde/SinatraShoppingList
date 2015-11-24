require 'bundler'
Bundler.require

get '/' do
  erb :home
end
