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

	def getSurveys
		j = ActiveSupport::JSON
		project = Project.find(params[:id])
		surveys = project.surveys
		respond_to do |format|
    		format.json { render :json => j.encode(surveys) }
  		end
	end

	def getComments
		j = ActiveSupport::JSON
		project = Project.find(params[:id])
		comments = project.comments
		respond_to do |format|
    		format.json { render :json => j.encode(comments) }
  		end
	end

	def getMarks
		j = ActiveSupport::JSON
		project = Project.find(params[:id])
		marks = project.marks
		respond_to do |format|
    		format.json { render :json => j.encode(marks) }
  		end
	end

	def getOptions
		j = ActiveSupport::JSON
		survey = Survey.find(params[:id])
		options = project.options
		respond_to do |format|
    		format.json { render :json => j.encode(options) }
  		end
	end

end