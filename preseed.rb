require 'rubygems'

require 'mongoid'

require_relative './leaf'
require_relative './sub_directory'


Mongoid.load!("./mongoid.yml", :production)

SubDirectory.new(path: 'root', name: 'root', timestamp: Time.now).save!