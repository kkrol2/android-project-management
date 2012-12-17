class Admins::ImagesController < Admins::AdminsController
	layout 'admin'


	def index
		@project = Project.find(params[:project_id])
		@images = @project.images
	end

	def show
		@project = Project.find(params[:project_id])
		@image = Image.find(params[:id])
	end

	def edit
		@project = Project.find(params[:project_id])
		@image = Image.find(params[:id])

	end

	def new
    	@project = Project.find(params[:project_id])
    	@image = @project.images.build
  	end

   def destroy
      Image.find(params[:id]).destroy
      redirect_to :action => 'index'
   end

	def create
	    @project = Project.find(params[:project_id])
	    filename = upload()
	  	if filename != nil
	  		params[:image][:path] = filename
	  	end
	    @image = @project.images.build(params[:image])
	    if @image.save
      			redirect_to (admins_project_image_path(@project,@image))
  			 else
      			format.html  { render :action => "new" }
    	end
	end

	def update

	  	@image = Image.find(params[:id])
	  	filename = upload()
	  	if filename != nil
	  		params[:image][:path] = filename
	  	end
      	if @image.update_attributes(params[:image])
         	redirect_to :action => 'show', :id => @image
      	else
         	render :action => 'edit'
      	end
	end
end