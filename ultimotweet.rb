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

	def erb(template)
  		template_file = File.open("ultimotweet.html.erb", 'r')
  		ERB.new(File.read(template_file)).result(binding)
	end
	
	#Método call
	def call env
		req = Rack::Request.new(env)
	    
		binding.pry if ARGV[0]

		@nombre = (req["txtnombre"] && req["txtnombre"] != '' && Twitter.user?(req["txtnombre"]) == true ) ? req["txtnombre"] : ''

		@num_tweets = (req["txtnum"] && req["txtnum"].to_i>1 ) ? req["txtnum"].to_i : 1
		puts "#{req["txtnum"]}"

		#Comprobamos el nombre y si existe lanzamos la busqueda
		if @nombre == req["txtnombre"]
			puts "#{@tweets}"
			ultimos_tweets = Twitter.user_timeline(@nombre,{:count=>@num_tweets.to_i})
			@tweets =(@tweets && @tweets != '') ? ultimos_tweets.map{ |i| i.text} : ''				
		end

		#Llamamos a erb
		Rack::Response.new(erb('ultimotweet.html.erb'))
	end

end


Rack::Server.start(
	:app => Twitts.new,
    	:Port => 8080,
    	:server => 'thin'
)
