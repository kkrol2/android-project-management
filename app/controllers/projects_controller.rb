class ProjectsController < ApplicationController

	layout "standard"

	def view
		name = params[:id]
		name.gsub!("_"," ")
		@project = Project.find_by_name(params[:id])
		if @project == nil
			raise ActionController::RoutingError.new('Not Found')
		end
	end

	def getProject
		j = ActiveSupport::JSON
		project = Project.find(params[:id])
		respond_to do |format|
    		format.json { render :json => j.encode(project) }
  		end
	end

	def getImages
		j = ActiveSupport::JSON
		project = Project.find(params[:id])
		images = project.images
		respond_to do |format|
    		format.json { render :json => j.encode(images) }
  		end
	end

end