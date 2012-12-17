class Admins::MarksController < Admins::AdminsController

	layout 'admin'	

	def index
		@project = Project.find(params[:project_id])
		@marks = @project.marks
	end

	def show
		@project = Project.find(params[:project_id])
		@mark = Mark.find(params[:id])
	end

	def edit
		@project = Project.find(params[:project_id])
		@mark = Mark.find(params[:id])

	end

	def new
    	@project = Project.find(params[:project_id])
    	@mark = @project.marks.build
  	end

   def destroy
      Mark.find(params[:id]).destroy
      redirect_to :action => 'index'
   end

	def create
	    @project = Project.find(params[:project_id])
	    @mark = @project.marks.build(params[:mark])
	    if @mark.save
      			redirect_to :action => 'show', :id => @mark
  			 else
      			format.html  { render :action => "new" }
    	end
	end

	def update

	  	@mark = Mark.find(params[:id])
      	if @mark.update_attributes(params[:mark])
         	redirect_to :action => 'show', :id => @mark
      	else
         	render :action => 'edit'
      	end
	end
end