class EntriesController < ApplicationController
	require 'securerandom'

	def index
		@entries = Entry.all
	end

	def show
		@entry = Entry.find_by_base64_id(params[:id])

		full_url = entry_url(@entry.base64_id)

		@shortUrlPairs = Hash.new

		# # bitly shorten
		# bitly = Shortly::Clients::Bitly
		# bitly.login = 'liydaxia'
		# bitly.apiKey = 'R_77dc8a24a4f47cc030319f942e346b1c'
		# struct = bitly.shorten(full_url)
		# if !struct.nil?
		# 	@shortUrlPairs["bitly"] = struct.url
		# end

		# # google shorten
		# googl = Shortly::Clients::Googl
		# # I didn't setup the billing, so cannot use api key
		# # googl.apiKey = 'xxx'
		# struct = googl.shorten full_url
		# if !struct.nil?
		# 	@shortUrlPairs["google"] = struct.shortUrl
		# end

		# tinyurl = Shortly::Clients::Tinyurl
		# struct = tinyurl.shorten full_url
		# if !struct.nil?
		# 	@shortUrlPairs["tinyurl"] = struct.shorturl
		# end
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

		base64 = SecureRandom.urlsafe_base64(5)
		while Entry.find_by_base64_id(base64)
			base64 = SecureRandom.urlsafe_base64(5)
		end
		@entry.base64_id = base64;

		if @entry.save
		      redirect_to entry_path(@entry.base64_id), :flash => {:success => "Successfully created entry"}
		else
			render 'new', :flash => { :error => @entry.errors.full_messages }
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		flash[:info] = "Successfully removed entry"
	    redirect_to entrys_path
	end
end
