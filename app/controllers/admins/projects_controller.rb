class Admins::ProjectsController < Admins::AdminsController
	layout 'admin'

	def show
		@project = Project.find(params[:id])
	end

	def edit
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def destroy
      Project.find(params[:id]).destroy
      redirect_to '/admins/projects'
      
   end

   def create
	    

	  	@project = Project.new(params[:project])
	    if @project.save
      			redirect_to (admins_project_path(@project))
  			 else
      			format.html  { render :action => "new" }
    	end
	end

	def update

	  	@project = Project.find(params[:id])
      	if @project.update_attributes(params[:project])
         	redirect_to :action => 'show', :id => @project
      	else
         	render :action => 'edit'
      	end
	end
end