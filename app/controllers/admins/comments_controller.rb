class Admins::CommentsController < Admins::AdminsController
	layout 'admin'


	

	def index
		@project = Project.find(params[:project_id])
		@comments = @project.comments
	end

	def show
		@project = Project.find(params[:project_id])
		@comment = Comment.find(params[:id])
	end

	def edit
		@project = Project.find(params[:project_id])
		@comment = Comment.find(params[:id])

	end

	def new
    	@project = Project.find(params[:project_id])
    	@comment = @project.comments.build
  	end

   def destroy
      Comment.find(params[:id]).destroy
      redirect_to :action => 'index'
   end

	def create
	    @project = Project.find(params[:project_id])
	    filename = upload()
	    @comment = @project.comments.build(params[:comment])
	    if @comment.save
      			redirect_to :action => 'show', :id => @comment
  			 else
      			format.html  { render :action => "new" }
    	end
	end

	def update

	  	@comment = Comment.find(params[:id])
      	if @comment.update_attributes(params[:comment])
         	redirect_to :action => 'show', :id => @comment
      	else
         	render :action => 'edit'
      	end
	end
end