require 'rubygems'
require 'sinatra'
require 'mongoid'
require 'pry'
#Mongoid.load!("mongoid.yml")
Mongoid.load!("./mongoid.yml", :production)
require_relative './sub_directory'
require_relative './leaf'

#binding.pry
get '/root/*/*-delete' do
	path = params[:splat][0] + '/' + params[:splat][1]
	sd = SubDirectory.where(path: path).first
	sd.destroy
	redirect '/root/' + params[:splat][0]
end

get '/root/*-delete' do
	path = params[:splat][0]
	sd = SubDirectory.where(path: path).first
	sd.destroy
	redirect '/root'
end

get '/root/' do
	redirect "/root"
end

get '/root' do
	sd = SubDirectory.where(name: "root").first
	erb :subdir, :locals => {:name => sd.name,:path => sd.path,:parents => sd.parents,:children => sd.children,:url_frag => sd.path.split("/"), :leafs => Leaf.all.desc(:timestamp)}
end

get '/root/*/' do
	redirect "/root/" + params[:splat][0]
end

get '/root/*' do
	path = params[:splat][0]
	sd = SubDirectory.where(path: path).first
	black_hole = SubDirectory.where(path: /^#{path}/i)
	leafz = []
	black_hole.each do |subdir|
		subdir.leafs.each do |leaf|
			leafz << leaf
		end
	end
	leaf_collection = leafz.sort_by { |hsh| hsh[:timestamp] || Time.new(2012)}.reverse
	erb :subdir, :locals => {:name => sd.name,:path => sd.path,:parents => sd.parents,:children => sd.children, :url_frag => sd.path.split("/"), :leafs => leaf_collection}
end

post '/root/*-upload' do
	path = params[:splat][0]
	f = params[:file]
	lf = Leaf.new(type: f[:type] , filename: f[:filename], description: params["description"], timestamp: Time.now)

	File.open('public/uploads/' + lf.id + "_" + f[:filename], "wb") do |file|
    	file.write(f[:tempfile].read)
  	end

	node = SubDirectory.where(path: path).first
	lf.sub_directory = node
	lf.save!
	redirect '/root/' + path
end

post '/root/*' do
	path = params[:splat][0]
	sd = SubDirectory.new(path: path +"/"+ params[:name], name: params[:name], timestamp: Time.now)
	sdP = SubDirectory.where(path: path).first
	sd.parents << sdP
	sd.save!
	redirect '/root/' + path
end

post '/root' do
	path = 'root'
	sd = SubDirectory.new(path: params[:name], name: params[:name], timestamp: Time.now)
	sdP = SubDirectory.where(path: path).first
	sd.parents << sdP
	sd.save!
	redirect '/root'
end

get '/*' do
  redirect '/root'
end