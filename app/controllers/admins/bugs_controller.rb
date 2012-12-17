class Admins::BugsController < Admins::AdminsController
	layout 'admin'


	

	def index
		@project = Project.find(params[:project_id])
		@bugs = @project.bugs
	end

	def show
		@project = Project.find(params[:project_id])
		@bug = Bug.find(params[:id])
	end

	def edit
		@project = Project.find(params[:project_id])
		@bug = Bug.find(params[:id])

	end

	def new
    	@project = Project.find(params[:project_id])
    	@bug = @project.bugs.build
  	end

   def destroy
      Bug.find(params[:id]).destroy
      redirect_to :action => 'index'
   end

	def create
	    @project = Project.find(params[:project_id])
	    @bug = @project.bugs.build(params[:bug])
	    if @bug.save
      			redirect_to :action => 'show', :id => @bug
  			 else
      			format.html  { render :action => "new" }
    	end
	end

	def update

	  	@bug = Bug.find(params[:id])
      	if @bug.update_attributes(params[:bug])
         	redirect_to :action => 'show', :id => @bug
      	else
         	render :action => 'edit'
      	end
	end
end