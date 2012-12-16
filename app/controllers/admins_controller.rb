class AdminsController < ApplicationController
	before_filter :logged_in
	def show
	end
	private
    def logged_in
    	authenticate_admin!
  	end
end