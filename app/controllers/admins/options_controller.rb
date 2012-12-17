class Admins::OptionsController < Admins::AdminsController
	layout 'admin'


	

	def index
		@project = Project.find(params[:project_id])
		@survey = Survey.find(params[:survey_id])
		@options = @survey.options
	end

	def show
		@project = Project.find(params[:project_id])
		@survey = Survey.find(params[:survey_id])
		@option = Option.find(params[:id])
	end

	def edit
		@project = Project.find(params[:project_id])
		@survey = Survey.find(params[:survey_id])
		@option = Option.find(params[:id])

	end

	def new
    	@project = Project.find(params[:project_id])
    	@survey = Survey.find(params[:survey_id])
    	@option = @survey.options.build
  	end

   def destroy
      Option.find(params[:id]).destroy
      redirect_to :action => 'index'
   end

	def create
	    @survey = Survey.find(params[:survey_id])
	    @option = @survey.options.build(params[:option])
	    if @option.save
      			redirect_to :action => 'show', :id => @option
  			 else
      			format.html  { render :action => "new" }
    	end
	end

	def update

	  	@option = Option.find(params[:id])
      	if @option.update_attributes(params[:option])
         	redirect_to :action => 'show', :id => @option
      	else
         	render :action => 'edit'
      	end
	end
end