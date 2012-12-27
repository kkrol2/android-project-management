class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource
  helper_method :generateMenu

  def index
  end

  def upload
  	uploaded_io = params[:image_path]
  	if(uploaded_io == nil)
  		return nil
  	end
  	filename = uploaded_io.original_filename
  	File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
  	     file.write(uploaded_io.read)
	 end
	 return filename
  end

  def generateMenu
    res = ""
    projects = Project.all
    projects.each do |project|
      res = res + "<li><a href='"+ admins_project_path(project) + "'>"+project.name+"</a></li>"
    end
    return res
  end


  protected

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    '/admins'
  end

end
