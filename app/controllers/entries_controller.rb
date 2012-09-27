class EntriesController < ApplicationController
	require 'securerandom'

	def index
		@entries = Entry.all
	end

	def show
		@entry = Entry.find(params[:id])

		full_url = entry_url(@entry.id)

		@shortUrlPairs = Hash.new

		# bitly shorten
		bitly = Shortly::Clients::Bitly
		bitly.login = 'liydaxia'
		# TODO: the api key should be an env variable.
		bitly.apiKey = 'R_77dc8a24a4f47cc030319f942e346b1c'
		struct = bitly.shorten(full_url)
		if !struct.nil?
			@shortUrlPairs["bitly"] = struct.url
		end

		# google shorten
		googl = Shortly::Clients::Googl
		# I didn't setup the billing, so cannot use api key
		# googl.apiKey = 'xxx'
		struct = googl.shorten full_url
		if !struct.nil?
			@shortUrlPairs["google"] = struct.shortUrl
		end

		tinyurl = Shortly::Clients::Tinyurl
		struct = tinyurl.shorten full_url
		if !struct.nil?
			@shortUrlPairs["tinyurl"] = struct.shorturl
		end

		# whether to show the edit button
		@is_owner = is_owner(@entry)
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(params[:entry])

		if @entry.content.empty?
			render 'new', :flash => { :error => "Empty content"}
			return
		end

		# set password
		@entry.password = "0000"
		
		if @entry.save
			# update the password cookie
			cookies.permanent[@entry.id] = @entry.password

		    redirect_to entry_path(@entry.id), :flash => {:success => "Successfully created entry"}
		else
			render 'new', :flash => { :error => @entry.errors.full_messages }
		end
	end

	def edit
		@entry = Entry.find(params[:id])

		# if password is set
		ps = params[:password]
		if ps == @entry.password
			# render edit view
		else
			# if the user is not is_owner to edit the entry
			if !is_owner(@entry)
				# cannot edit the entry, create new entry
				redirect_to new_entry_path
			end
		end
	end

	def update
		@entry = Entry.find(params[:id])
		
		if @entry.update_attributes(params[:entry])
			flash[:success] = 'Update sucessfully'
			redirect_to @entry
		else
			flash[:error] = 'Update railed'
			render 'edit'
		end
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		flash[:info] = "Successfully removed entry"
	    redirect_to new_entry_path
	end

private
	
	def is_owner(entry)
		cookies[entry.id] != nil && cookies[entry.id] == entry.password
	end

end
