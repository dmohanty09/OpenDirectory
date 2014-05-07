OpenDirectory
=============

OpenDirectory is a free public file system to help bring the world closer together...

---------------------------------------------------------------
Install Ruby:
curl -sSL https://get.rvm.io | bash -s stable --ruby
Install MongoDB

---------------------------------------------------------------
Use Gem which comes with Ruby to install bundler.
	gem install bundler

---------------------------------------------------------------
Use Bundler to install all the gem dependencies the project requires. Make sure you are in the project directory.
	bundle install

---------------------------------------------------------------
Once Mongo is running you need to preseed the database. To do this you need to run the preseed.rb script. 

---------------------------------------------------------------
Lastly you need to run OpenDirectory.
	ruby app.rb
