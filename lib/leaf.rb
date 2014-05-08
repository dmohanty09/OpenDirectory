require 'sinatra'
require_relative './models/leaf'

get '/leaf' do
	'foo'
end

get '/leaf/:id' do
	'foo'
end

post '/leaf/:id' do
	'foo'
end

put '/leaf/:id' do
	'foo'
end

delete '/leaf/:id' do
	'foo'
end