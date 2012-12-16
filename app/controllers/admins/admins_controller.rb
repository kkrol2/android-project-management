class Admins::AdminsController < ApplicationController
	layout 'admin'
	before_filter :logged_in

	def index
		@projects = Project.all
	end

	def destroy
	end

	 private
    def logged_in
    authenticate_admin!
  end
end