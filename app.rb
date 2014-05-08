require 'rubygems'
require 'sinatra'
require 'mongoid'

Mongoid.load!("./mongoid.yml", :development)

require_relative './lib/branch'
require_relative './lib/leaf'