class @CompleteTasksUseCase
  constructor: ->

  fetchProjectDummy: (id) =>

  setProject: (data) =>
  	@project = data
  	if @images != null and @images != undefined
  	  @initGuiDummy()

  setImages: (data) =>
  	@images = data
  	if @project !=null and @project != undefined
  		@initGuiDummy()

  initGuiDummy: =>

  getProject: =>
  	return @project

  getImages: =>
  	return @images


