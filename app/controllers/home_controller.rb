class HomeController < ApplicationController
	def redirect_to_https
    redirect_to :protocol => "https://" unless (request.ssl? || request.local?)
	end

	before_filter :redirect_to_https

	before_filter :authenticate_user!, except: [:privacy]

	def welcome
	end

	def persisted
	end

	def failure
	end

	def new_user
	end
	
	def privacy
	end
end
