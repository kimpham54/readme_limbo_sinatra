# require_relative '../../config/env.rb'
# require_relative '../../constants.rb'
# require_relative '../../secrets.rb'
# require 'pry'
# require 'sinatra'
class ApplicationController < Sinatra::Base

	configure do
		set :views, 'app/views'
		set :public_folder, 'public'
		enable :sessions		
		set :session_secret, ENV['SESSION_SECRET']

	end

	get '/' do 
		erb :index
	end


	get '/error' do 
		erb :error
	end

	helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find_by(id: session[:user_id])
		end

		def authenticate
			if !logged_in?
				redirect '/login'
			end
		end


		def authenticate_user(reading)
			# authenticate
			# if !reading
			# 	@message = "item not found"
			# 	erb :error
			# end
			# if current_user != reading.user
			# 	@message = "cannot access item"
			# 	erb :error
			# end
			redirect '/error' if !reading
			redirect '/error' if current_user != reading.user
		end



	end



		get '/test' do
		"hello"
	end



end