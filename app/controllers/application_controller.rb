require_relative '../../config/env.rb'
require_relative '../../constants.rb'
require_relative '../../secrets.rb'
require 'pry'
require 'sinatra'
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
			redirect '/' if !reading
			redirect '/' if current_user != reading.user
		end



	end



		get '/test' do
		"hello"
	end



end