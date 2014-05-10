require 'rubygems'
require 'sinatra'
require 'mongoid'

Mongoid.load!("./mongoid.yml", :development)

require_relative './lib/branch'
require_relative './lib/leaf'
require_relative './lib/user'

get '/' do
  redirect '/index.html'
end