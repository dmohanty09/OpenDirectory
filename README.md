OpenDirectory
=============

OpenDirectory is a free public file system to help bring the world closer together...

Install Ruby:

curl -sSL https://get.rvm.io | bash -s stable --ruby

Install/Start MongoDB

Install bundler:

gem install bundler

Install:

bundle install

Preseed database:

pry/irb:

require 'mongoid'

require_relative './sub_directory'

Mongoid.load!("./mongoid.yml", :production)

SubDirectory.new(path: 'root', name: 'root', timestamp: Time.now)
 
Run:

ruby config.ru
