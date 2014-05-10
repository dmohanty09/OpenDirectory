require 'sinatra'
require_relative './models/branch'

#Gets a feed of leafs for a specific branch
get '/branch/feed/:id' do
end

#Creates a branch associated with a parent branch
post '/branch/:id'
end

#Creates a leaf in a specific branch associated with a user
post '/branch/:id/leaf/:uid'
end