class Admins::SurveysController < Admins::AdminsController

	layout 'admin'	

	def index
		@project = Project.find(params[:project_id])
		@surveys = @project.surveys
	end

	def show
		@project = Project.find(params[:project_id])
		@survey = Survey.find(params[:id])
		@options = @survey.options
	end

	def edit
		@project = Project.find(params[:project_id])
		@survey = Survey.find(params[:id])

	end

	def new
    	@project = Project.find(params[:project_id])
    	@survey = @project.surveys.build
  	end

   def destroy
      Survey.find(params[:id]).destroy
      redirect_to :action => 'index'
   end

	def create
	    @project = Project.find(params[:project_id])
	    @survey = @project.surveys.build(params[:survey])
	    if @survey.save
      			redirect_to :action => 'show', :id => @survey
  			 else
      			format.html  { render :action => "new" }
    	end
	end

	def update

	  	@survey = Survey.find(params[:id])
      	if @survey.update_attributes(params[:survey])
         	redirect_to :action => 'show', :id => @survey
      	else
         	render :action => 'edit'
      	end
	end
end