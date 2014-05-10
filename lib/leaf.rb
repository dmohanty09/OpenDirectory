require 'sinatra'
require_relative './models/leaf'

#gets details of a leaf (description/comments)
get '/leaf/:id' do
end

#post comment on leaf associated with a user
post '/leaf/:id/comment/:uid' do
end

#record an upvote/downvote on a leaf associated with a user
post '/leaf/:id/vote/:uid' do
end