# -*- coding: utf-8 -*-
require 'twitter'
require './configure'
require 'rack'
require 'pry-debugger'
require 'thin'
require 'erb'

class Twitts

	#Constructor
	def initialize
		@tweets = []
		@nombre = ''
		@num_tweets = 0		
	end

	#Acceso al HTML para mostrar los resultados
	def erb(template)
  		template_file = File.open("ultimotweet.html.erb", 'r')
  		ERB.new(File.read(template_file)).result(binding)
	end
	
	#Método call
	def call env
	    	req = Rack::Request.new(env)
	    
	    	binding.pry if ARGV[0]
	   
	   	
	    	@nombre = (req["txtusuario"] && req["txtusuario"] != '' && Twitter.user?(req["txtusuario"]) == true ) ? req["txtusuario"] : ''
		@num_tweets = (req["txtnum"] && req["txtnum"].to_i>1 ) ? req["txtnum"].to_i : 1
		puts "#{req["txtnum"]}"
		if @name == req["txtusuario"]
			puts "#{@tweets}"
			ultimos_tweet = Twitter.user_timeline(@nombre,{:count=>@num_tweets.to_i})
			@tweets =(@tweets && @tweets != '') ? ultimos_tweet.map{ |i| i.text} : ''				
		end

		#Invoca a erb
		Rack::Response.new(erb('ultimotweet.html.erb'))
	end
end


if $0 == __FILE__
	Rack::Server.start(
# 		:app => Rack::ShowExceptions.new(
#        	Rack::Lint.new(
#           	Rack::Twitts.new)), 
		:app => Twitts.new,
	    :Port => 9494,
	    :server => 'thin'
  	)
end
