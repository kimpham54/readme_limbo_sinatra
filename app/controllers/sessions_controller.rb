class SessionsController < ApplicationController

	get '/login' do
		@failed = false
		erb :'sessions/login'
	end

	post '/login' do
		user = User.find_by(username: params[:username])
		if !!user && (auth = user.authenticate(params[:password]))
			session[:user_id] = user.id
			redirect :'/'
		else
			@failed = true
			erb :'sessions/login'
		end
	end

	get '/signup' do
		erb :'sessions/signup'

	end

	post '/signup' do
		@user = User.create(name: params[:name], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
		if @user.errors.any?
			erb :'sessions/signup'
		else
			session[:user_id] = @user.id
			redirect '/'
		end
	end

	delete '/logout' do
		session.clear
		redirect '/'
	end



end