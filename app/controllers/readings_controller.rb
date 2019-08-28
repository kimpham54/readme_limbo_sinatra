class ReadingsController < ApplicationController


get '/readings'  do
		# authenticate
		@readings = Reading.all
		erb :'readings/index'
	end

	get '/readings/new' do
		authenticate
		erb :'readings/new'
	end

	post '/readings' do
		authenticate
		newuser = current_user
		newuser.readings.build(title: params[:title], url: params[:url], notes: params[:notes])
		if newuser.save
			redirect "/readings"
		else
			@message = "could not save reading"
			erb :'/readings/new'
		end
	end

	get '/readings/:id/edit' do
		@reading = Reading.find_by(id: params[:id])
		# return authenticate_user(@reading)
		# erb :'readings/edit'
		authenticate_user(@reading)
		erb :'readings/edit'
		# if @reading
		# 	erb :'readings/edit'
		# else
		# 	erb :error
		# end
	end



	delete '/readings/:id' do
		@deletereading = Reading.find_by(id: params[:id])
		# return authenticate_user(@deletereading)
		# authenticate_user(@deletereading)
		# authenticate_user(@reading)
		if @deletereading
			@deletereading.destroy
			redirect "/readings"
		else
			erb :error
		end

	end


	patch '/readings/:id' do
		@reading = Reading.find_by(id: params[:id])
		authenticate_user(@reading)
		@reading.update(title: params[:title], url: params[:url], notes: params[:notes])
		redirect '/readings'
		# insert message that it was updated"

	end




end