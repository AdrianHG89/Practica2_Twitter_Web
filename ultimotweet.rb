# encoding: utf-8
require 'twitter'
require './configure'
require 'rack'
require 'pry-debugger'
require 'thin'
require 'erb'

class UltimoTweet
	


	def call env
		#Constructor
		def initialize
			@tweets = []
			@nombre = ''
			@num_tweets = 0		
		end

	end


###############################################
###############################################
Rack::Server.start(
  :app => UltimoTweet.new,
  :Port => 8080,
  :server => 'thin'
)
###############################################
###############################################
