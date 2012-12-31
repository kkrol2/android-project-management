class @WebGui
  constructor: ->
   
  init: (project,images) =>
  	@initHeadline(project)
  	@initGallery(images)

  createElementFor: (data,templateId) =>
    source = $(templateId).html();
    template = Handlebars.compile(source)
    return template(data)

  initHeadline: (project) =>
  	$("#site_title").html(@createElementFor(project,"#header_template"))

  initGallery: (images) =>

  	 for image in images
       $("#cs_slider").append(@createElementFor(image,"#image_template"))

  	 $('#gallery').ContentSlider({
                    width : '940px',
                    height : '240px',
                    speed : 400,
                    easing : 'easeOutSine'
                    });
