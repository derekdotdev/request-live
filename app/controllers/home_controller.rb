class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:privacy]

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
